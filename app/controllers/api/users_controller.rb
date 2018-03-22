class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /api/users
  def index
    @users = User.all

    render json: @users
  end

  # GET /api/users/1
  def show
    render json: @user
  end

  # POST /api/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :email)
    end
end
