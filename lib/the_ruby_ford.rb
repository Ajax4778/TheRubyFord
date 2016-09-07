class IceAndFire
  def initialize
    @client = ApiClient.new
  end

  def character(id)
    return unless id

    req_string = 'characters/' + id.to_s
    attributes = @client.get(req_string)

    Character.new(attributes)
  end

  def book(id)
    return unless id

    req_string = 'books/' + id.to_s
    attributes = @client.get(req_string)

    Book.new(attributes)
  end

  def house(id)
    return unless id

    req_string = 'houses/' + id.to_s
    attributes = @client.get(req_string)

    House.new(attributes)
  end
end

require 'ice_and_fire/api_client'
require 'ice_and_fire/character'
require 'ice_and_fire/book'
require 'ice_and_fire/house'
require 'ice_and_fire/cache'
