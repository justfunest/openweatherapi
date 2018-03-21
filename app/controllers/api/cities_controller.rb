module Api
  class CitiesController < BaseController
    def index
      cities = City.order('name')
      if params[:limit]
        unless (params[:limit].to_i > 0)
          render json: {status: 'error', message: 'bad input parameter'}, status: :bad_request and return
        else
          cities = cities.limit(params[:limit])
        end
      end

      render json: cities
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
        render json: {status: 'error', message: 'city not found'}, status: :not_found
      end

    end

    def create
      city = City.new(city_params)
      if city.save
        render json: city, status: :created
      else
        render json: {status: 'error', message: 'city not saved', errors: city.errors}, status: :conflict
      end
    end

    def city_params
      params.permit(:name, :latitude, :longitude, :iso_code_alpha_2, :population)
    end
  end
end
