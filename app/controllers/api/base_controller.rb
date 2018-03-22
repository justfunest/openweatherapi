module Api
  class BaseController < ApplicationController
    before_action :authenticate

    def authenticate
      api_key_token = request.headers["X-Api-Key"]
      @user = User.where(api_key: api_key_token).first if api_key_token
      unless @user
        head :unauthorized
        return false
      end
    end
  end
end
