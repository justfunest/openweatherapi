class WeatherCondition < ApplicationRecord
  has_many :city_weather_conditions
  has_many :city_weathers, :through => :city_weather_conditions
  belongs_to :weather_condition_group

  validates :description, presence: true
  validates :icon, presence: true
end
