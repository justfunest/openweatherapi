module Api
  class ForecastController < ApplicationController
      def index
        forecast_days = 7
        query_end_date = Time.now.to_date.to_datetime
        query_start_date = query_end_date - forecast_days.days
        weathers = CityWeather.where(["city_id = ? and time_of_data_forecasted BETWEEN ? AND ? ", params['city_id'], query_start_date, query_end_date])

        render json: weathers
      end
  end


end

