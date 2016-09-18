require 'active_support/inflector'

class IceAndFire::Base
  def initialize(attributes)
    raise "Invalid attributes for #{self.class}." unless valid?(attributes)

    method_names.each do |name|
      self.class.send(:attr_reader, name)

      value = attributes[name.to_s.camelize(:lower)]
      instance_variable_set("@#{name}", value)
    end
  end

  private

  def method_names
    raise NotImplementedError
  end

  def valid?(attributes)
    method_names == attributes.keys.sort.map { |k| k.underscore.to_sym }
  end
end
