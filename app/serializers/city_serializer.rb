class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :coordinates, :iso_code_alpha_2, :population
  has_one :coordinates

  def coordinates
    { :longitude => object.longitude, :latitude => object.latitude}
  end

end
