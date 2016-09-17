class IceAndFire::Character < IceAndFire::Base
  CHARACTER_ATTRIBUTES = [
    :aliases, :allegiances, :books, :born, :culture,
    :died, :father, :gender, :mother, :name, :played_by,
    :pov_books, :spouse, :titles, :tv_series, :url
  ]

  private

  def method_names
    CHARACTER_ATTRIBUTES
  end
end
