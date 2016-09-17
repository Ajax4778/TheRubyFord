class IceAndFire::House < IceAndFire::Base
  HOUSE_ATTRIBUTES = [
    :ancestral_weapons, :cadet_branches, :coat_of_arms,
    :current_lord, :died_out, :founded, :founder, :heir,
    :name, :overlord, :region, :seats, :sworn_members,
    :titles, :url, :words
  ]

  private

  def method_names
    HOUSE_ATTRIBUTES
  end
end
