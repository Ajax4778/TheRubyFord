class IceAndFire::Book < IceAndFire::Base
  BOOK_ATTRIBUTES = [
    :authors, :characters, :country, :isbn,
    :media_type, :name, :number_of_pages,
    :pov_characters, :publisher, :released, :url
  ]

  private

  def method_names
    BOOK_ATTRIBUTES
  end
end
