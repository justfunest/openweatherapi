class CityWeather < ApplicationRecord
  has_many :city_weather_conditions
  has_many :weather_conditions, :through => :city_weather_conditions
  belongs_to :city

  validates :temperature, presence: true, numericality: true
  validates :temperature_minimum, presence: true, numericality: true
  validates :temperature_maximum, presence: true, numericality: true
  validates :pressure_sea_level_default, presence: true, numericality: true
  validates :pressure_seal_level, presence: true, numericality: true
  validates :pressure_ground_level, presence: true, numericality: true
  validates :humidity, presence: true, numericality: true
  validates :cloudiness_percentage, presence: true, numericality: true
  validates :wind_speed, presence: true, numericality: true
  validates :wind_degree, presence: true, numericality: true
  validates :pressure_sea_level_default, presence: true, numericality: true
  validates :time_of_data_forecasted, presence: true
end
