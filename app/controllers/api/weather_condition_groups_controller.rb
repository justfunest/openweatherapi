module Api
  class WeatherConditionGroupsController < ApplicationController
    def index
      groups = WeatherConditionGroup.order('name')
      render json: groups
    end

    def show
      begin
        group = WeatherConditionGroup.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        group = false
      end

      if group
        render json: group, status: :ok
      else
        render json:  {status: 'error', message: 'Group not found'}, status: :not_found
      end

    end

    def create
      group = WeatherConditionGroup.new(group_params)
      if group.save
        render json: group, status: :created
      else
        render json:  {status: 'error', message: 'Group not saved', errors: group.errors}, status: :unprocessable_entity
      end
    end

    def group_params
      params.permit(:name)
    end
  end
end
