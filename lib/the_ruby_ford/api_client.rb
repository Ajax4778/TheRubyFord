require 'net/http'
require 'json'

class ApiClient
  API_URL = 'http://anapioficeandfire.com/api/'

  def self.get(req_string)
    new.get(req_string)
  end

  def get(req_string)
    req_url = URI.parse(API_URL + req_string)

    http_req = Net::HTTP::Get.new(req_url)
    http_res = Net::HTTP.start(req_url.host, req_url.port) do |http|
      http.request(http_req)
    end

    JSON.parse(http_res.body)
  end
end
