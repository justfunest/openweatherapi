module Api
  class ForecastController < BaseController
      def index
        forecast_days = 7
        query_start_date = Time.now.to_date.to_datetime
        query_end_date = query_start_date + forecast_days.days
        weathers = CityWeather.where(["city_id = ? and time_of_data_forecasted BETWEEN ? AND ? ", params['city_id'], query_start_date, query_end_date])
        if params[:limit]
          unless (params[:limit].to_i > 0)
            render json: {status: 'error', message: 'bad input parameter'}, status: :bad_request and return
          else
            weathers = weathers.limit(params[:limit])
          end
        end

        render json: weathers
      end
  end


end

