require 'json'
require 'active_support/inflector'

class IceAndFire::Book
  attr_reader :url, :name, :isbn, :authors, :number_of_pages, :publisher,
              :country, :media_type, :released, :characters, :pov_characters

  def initialize(attributes)
    attributes.each_pair do |attribute_name, value|
      instance_variable_set("@#{attribute_name.underscore}", value)
    end
  end
end
