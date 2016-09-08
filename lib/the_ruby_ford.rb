class IceAndFire
  def initialize
    @client = ApiClient.new
  end

  def character(id)
    req_string = 'characters/' + id.to_s
    @client.get(req_string)
  end

  def book(id)
    req_string = 'books/' + id.to_s
    @client.get(req_string)
  end

  def house(id)
    req_string = 'houses/' + id.to_s
    @client.get(req_string)
  end
end

require 'ice_and_fire/api_client'
require 'ice_and_fire/character'
require 'ice_and_fire/book'
require 'ice_and_fire/house'
require 'ice_and_fire/cache'
