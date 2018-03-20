module Api
  class CitiesController < ApplicationController
    def index
      cities = City.order('name')
      render json: {status: 'ok', message: 'Loaded cities', data: cities}, status: :ok
    end

    def show
      begin
        city = City.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        city = false
      end

      if city
        render json: city, status: :ok
      else
        render json:  {status: 'error', message: 'City not found'}, status: :not_found
      end

    end

    def create
      city = City.new(city_params)
      if city.save
        render json: {status: 'ok', message: 'City saved', data: city}, status: :created
      else
        render json:  {status: 'error', message: 'City not saved', errors: city.errors}, status: :unprocessable_entity
      end
    end

    def city_params
      params.permit(:name, :latitude, :longitude, :iso_code_alpha_2, :population)
    end
  end
end
