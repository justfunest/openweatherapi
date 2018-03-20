class WeatherConditionSerializer < ActiveModel::Serializer
  has_one :weather_condition_group
  attributes :id, :description, :icon
end
