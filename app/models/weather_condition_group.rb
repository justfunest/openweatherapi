class WeatherConditionGroup < ApplicationRecord
  validates :name, uniqueness: true
end
