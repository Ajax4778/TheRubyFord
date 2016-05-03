require 'json'
require 'active_support/inflector'

class IceAndFire::House
  attr_reader :url, :name, :region, :coat_of_arms, :words, :titles, :seats,
              :current_lord, :heir, :overlord, :founded, :founder, :died_out,
              :ancestral_weapons, :cadet_branches, :sworn_members

  def initialize(attributes)
    attributes.each_pair do |attribute_name, value|
      instance_variable_set("@#{attribute_name.underscore}", value)
    end
  end
end
