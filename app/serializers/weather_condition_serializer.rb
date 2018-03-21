class WeatherConditionSerializer < ActiveModel::Serializer
  belongs_to :weather_condition_group
  attributes :id, :description, :icon
end
