class CityWeatherCondition < ApplicationRecord
  belongs_to :city_weather
  belongs_to :weather_condition
end
