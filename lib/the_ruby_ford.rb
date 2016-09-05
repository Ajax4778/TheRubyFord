class IceAndFire
  API_OBJECTS = %w(character book house)

  def self.character(id)
    new.character(id)
  end

  def self.book(id)
    new.book(id)
  end

  def self.house(id)
    new.house(id)
  end

  def character(id)
    return unless id

    req_string = 'characters/' + id.to_s
    attributes = ApiClient.get(req_string)

    IceAndFire::Character.new(attributes)
  end

  def book(id)
    return unless id

    req_string = 'books/' + id.to_s
    attributes = ApiClient.get(req_string)

    IceAndFire::Book.new(attributes)
  end

  def house(id)
    return unless id

    req_string = 'houses/' + id.to_s
    attributes = ApiClient.get(req_string)

    IceAndFire::House.new(attributes)
  end
end

require 'ice_and_fire/api_client'
require 'ice_and_fire/character'
require 'ice_and_fire/book'
require 'ice_and_fire/house'
require 'ice_and_fire/cache'
