class WeatherConditionGroup < ApplicationRecord
  has_many :weather_conditions
  validates :name, uniqueness: true, presence: true
end
