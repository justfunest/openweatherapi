class CityWeatherSerializer < ActiveModel::Serializer
  attributes :id, :time_of_data_forecasted_unix_timestamp, :time_of_data_forecasted_text
  has_one :main
  has_one :clouds
  has_one :wind
  has_one :rain
  has_one :snow
  has_many :weather_conditions

  def time_of_data_forecasted_unix_timestamp
    Time.parse(object.time_of_data_forecasted.to_s).to_i
  end

  def time_of_data_forecasted_text
    object.time_of_data_forecasted
  end

  def main
    {
        :temperature => object.temperature,
        :temperature_minimum => object.temperature_minimum,
        :temperature_maximum => object.temperature_maximum,
        :pressure_sea_level_default => object.pressure_sea_level_default,
        :pressure_seal_level => object.pressure_seal_level,
        :pressure_ground_level => object.pressure_ground_level,
        :humidity => object.humidity,
    }
  end

  def clouds
    {'all' => object.cloudiness_percentage}
  end

  def wind
    {:speed => object.wind_speed, :degree => object.wind_degree}
  end

  def rain
    unless object.rain_volume.nil?
      {'3h' => object.rain_volume}
    else
      {}
    end
  end

  def snow
    unless object.snow_volume.nil?
      {'3h' => object.snow_volume}
    else
      {}
    end
  end
end
