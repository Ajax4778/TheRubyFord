require 'json'

class IceAndFire::Character
  attr_reader :url, :name, :culture, :born, :died, :titles, :aliases,
              :father, :mother, :spouse, :allegiances, :books, :pov_books,
              :tv_series, :played_by

  def initialize(attributes)
    attributes.each_pair do |attribute_name, value|
      instance_variable_set("@#{snake_case(attribute_name)}", value)
    end
  end

  private

  def snake_case(str)
    return str if str.chars.all? { |c| c == c.downcase }
     snake_case_str = str.gsub(/(.)([A-Z])/,'\1_\2')
     snake_case_str.downcase!
   end
end
