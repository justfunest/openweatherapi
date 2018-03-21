module Api
  class OpenWeatherMapApiController < ApplicationController
    def import_city
     if params[:city_name]
        import = OpenWeatherMapApiImport.new

        import_result = import.get_and_save_city(params[:city_name])
        render json: import_result
     else
       render json: {status: 'error', message: 'bad input parameter'}, status: :bad_request and return
     end
    end
  end
end