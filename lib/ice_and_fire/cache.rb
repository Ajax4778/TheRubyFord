require_relative '../the_ruby_ford'

class IceAndFire::Cache
  DEFAULT_CACHE_LIMIT = 10

  def initialize
    @characters = {}
    @houses     = {}
    @books      = {}
  end

  IceAndFire::API_OBJECTS.each do |obj|
    define_method(obj) do |obj_id|
      instance_variable_get("@#{obj}s")[obj_id]
    end
  end
end
