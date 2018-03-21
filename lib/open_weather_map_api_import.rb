class OpenWeatherMapApiImport
  def initialize()
    @api = OpenWeatherMapApi.new(Rails.application.secrets.OPEN_WEATHER_API_ID)
    @weather_rows = 0
    @saved_weather_rows = 0
  end

  def get_and_save_city(*city_names)
    city_names.each do |city|
      if city.is_a? String
        data = @api.forecast(city, nil)
        @weather_rows = data['cnt']
        @saved_weather_rows = 0
        city = save_city(data['city'])

        data['list'].each do |location_data|
          save_city_weather(location_data, city)
        end
      end
    end
    {:weather_rows => @weather_rows, :saved_weather_rows => @saved_weather_rows}
  end

  #Saves city from api data and returns city object
  def save_city(api_city_data)
    unless city = City.find_by_name(api_city_data['name'])
      city_params = {
          :name => api_city_data['name'],
          :latitude => api_city_data['coord']['lat'],
          :longitude => api_city_data['coord']['lon'],
          :iso_code_alpha_2 => api_city_data['country'],
          :population => api_city_data['population']
      }

      city = City.new(city_params)
      unless city.save
        raise "Cant save city"
      end
      city
    end
    city
  end

  #Saves city weather from api data
  def save_city_weather(api_weather_data, city)
    city_weather_params = {
        :city_id => city.id,
        :temperature => api_weather_data['main']['temp'],
        :temperature_minimum => api_weather_data['main']['temp_min'],
        :temperature_maximum => api_weather_data['main']['temp_max'],
        :pressure_sea_level_default => api_weather_data['main']['pressure'],
        :pressure_seal_level => api_weather_data['main']['sea_level'],
        :pressure_ground_level => api_weather_data['main']['grnd_level'],
        :humidity => api_weather_data['main']['humidity'],
        :cloudiness_percentage => api_weather_data['clouds']['all'],
        :wind_speed => api_weather_data['wind']['speed'],
        :wind_degree => api_weather_data['wind']['deg'],
        :time_of_data_forecasted => api_weather_data['dt_txt'],
    }

    if !api_weather_data['snow'].nil? and api_weather_data['snow']['3h'].nil?
      city_weather_params[:snow_volume] = api_weather_data['snow']['3h'];
    end

    if !api_weather_data['rain'].nil? and !api_weather_data['rain']['3h']
      city_weather_params[:rain_volume] = api_weather_data['rain']['3h'];
    end

    city_weather = CityWeather.new(city_weather_params)

    unless city_weather.save
      #proabably duplicate entry
    else
      @saved_weather_rows += 1
      api_weather_data['weather'].each do |weather_condition_data|
        save_city_weather_conditions(weather_condition_data, city_weather)
      end

    end
  end

  #saves city_weather_condition
  def save_city_weather_conditions(api_weather_condition, city_weather)
    unless weather_condition = WeatherCondition.find_by_description(api_weather_condition['description'])
      weather_condition = save_weather_condition(api_weather_condition)
    end
    city_weather_condition = CityWeatherCondition.new
    city_weather_condition.city_weather = city_weather
    city_weather_condition.weather_condition = weather_condition
    city_weather_condition.save!
  end

  #saves and returns weather_condition
  def save_weather_condition(api_weather_condition)
    unless weather_condition_group = WeatherConditionGroup.find_by_name(api_weather_condition['main'])
      weather_condition_group = save_weather_condition_group(api_weather_condition['main'])
    end
    weather_condition_params = {
        :description => api_weather_condition['description'],
        :icon => api_weather_condition['icon']
    }

    weather_condition = WeatherCondition.new(weather_condition_params)
    weather_condition.weather_condition_group = weather_condition_group
    weather_condition.save!
    weather_condition
  end

  #saves and returns weather condition group
  def save_weather_condition_group(group_name)
    group = WeatherConditionGroup.new
    group.name = group_name
    unless group.save
      raise "Cant save weather condition group"
    end
    group
  end
end