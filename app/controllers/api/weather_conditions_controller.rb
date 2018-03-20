module Api
  class WeatherConditionsController < ApplicationController
    def index
      condition = WeatherCondition.all
      render json: condition
    end

    def show
      begin
        condition = WeatherCondition.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        condition = false
      end

      if condition
        render json: condition, status: :ok
      else
        render json:  {status: 'error', message: 'Weather condition not found'}, status: :not_found
      end

    end

    def create
      condition = WeatherCondition.new(condition_params)
      if condition.save
        render json: condition, status: :created
      else
        render json:  {status: 'error', message: 'Weather condition not saved', errors: condition.errors}, status: :unprocessable_entity
      end
    end

    def condition_params
      params.permit(:weather_condition_group_id, :description, :icon)
    end
  end
end
