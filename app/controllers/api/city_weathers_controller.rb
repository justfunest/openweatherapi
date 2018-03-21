module Api
  class CityWeathersController < BaseController
    def index
      city_weather = CityWeather.all
      render json: city_weather, status: :ok
    end

    def show
      begin
        city_weather = CityWeather.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        city_weather = false
      end

      if city_weather
        render json: city_weather, status: :ok
      else
        render json:  {status: 'error', message: 'City weather not found'}, status: :not_found
      end

    end

    def create
      city_weather = CityWeather.new(city_weather_params)
      if city_weather.save
        render json: city_weather, status: :created
      else
        render json:  {status: 'error', message: 'City weather not saved', errors: city_weather.errors}, status: :conflict
      end
    end

    def city_weather_params
      params.permit(:city_id, :temperature, :temperature_minimum, :temperature_maximum,
                    :pressure_sea_level_default, :pressure_seal_level, :pressure_ground_level,
                    :humidity, :cloudiness_percentage, :wind_speed, :wind_degree, :snow_volume, :rain_volume,
                    :pressure_sea_level_default, :time_of_data_forecasted
      )
    end
  end
end
