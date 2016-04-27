require_relative 'the_ruby_ford/api_client'

class IceAndFire
  API_OBJECTS = %w(character book house)

  class << self
    API_OBJECTS.each do |obj|
      define_method(obj) do |obj_id|
        new.send(obj.to_sym, obj_id)
      end
    end
  end

  API_OBJECTS.each do |obj|
    define_method(obj) do |obj_id|
      return unless obj_id

      req_string = obj + 's/' + obj_id.to_s
      ApiClient.get(req_string)
    end
  end
end
