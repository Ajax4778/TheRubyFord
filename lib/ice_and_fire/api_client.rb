require 'net/http'
require 'json'

class IceAndFire::ApiClient
  API_URL = 'http://anapioficeandfire.com/api/'

  def initialize
    @cache = IceAndFire::Cache.new
  end

  def get(req_string)
    cached_obj = @cache[req_string]
    return cached_obj if cached_obj

    req_url = URI.parse(API_URL + req_string)

    http_req = Net::HTTP::Get.new(req_url)
    http_res = Net::HTTP.start(req_url.host, req_url.port) do |http|
      http.request(http_req)
    end

    api_obj = JSON.parse(http_res.body)
    @cache[req_string] = api_obj

    api_obj
  end
end
