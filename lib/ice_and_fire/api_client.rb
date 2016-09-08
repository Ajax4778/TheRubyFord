require 'net/http'
require 'json'

class IceAndFire::ApiClient
  API_URL = 'http://anapioficeandfire.com/api/'

  def initialize
    @cache = IceAndFire::Cache.new
  end

  def get(req_string)
    cached_obj = get_from_cache(req_string)
    return cached_obj if cached_obj

    api_obj = get_from_api(req_string)
    add_to_cache(req_string, api_obj)

    api_obj
  end

  private

  def get_from_cache(req_string)
    @cache[req_string]
  end

  def add_to_cache(req_string, api_obj)
    @cache[req_string] = api_obj
  end

  def get_from_api(req_string)
    req_url = URI.parse(API_URL + req_string)

    http_req = Net::HTTP::Get.new(req_url)
    http_res = Net::HTTP.start(req_url.host, req_url.port) do |http|
      http.request(http_req)
    end

    attributes = JSON.parse(http_res.body)
    obj_class  = get_obj_class(req_string)

    obj_class.new(attributes)
  end

  def get_obj_class(req_string)
    type, _ = req_string.split('/')
    "IceAndFire::#{type.singularize.capitalize}".constantize
  end
end
