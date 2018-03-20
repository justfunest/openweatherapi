module Api
  class CityWeatherConditionsController < ApplicationController
    def index
      cities = CityWeatherCondition.order('name')
      render json: cities
    end

    def show
      begin
        city = CityWeatherCondition.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        city = false
      end

      if city
        render json: city, status: :ok
      else
        render json: {status: 'error', message: 'City not found'}, status: :not_found
      end

    end

    def create
      city_weather_condition = CityWeatherCondition.new(condition_params)
      if city_weather_condition.save
        render json: city_weather_condition, status: :created
      else
        render json: {status: 'error', message: 'City weather condition not saved', errors: city_weather_condition.errors}, status: :unprocessable_entity
      end
    end

    def condition_params
      params.permit(:weather_condition_id, :city_weather_id)
    end
  end
end

