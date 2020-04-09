class AuthenticationController < ApplicationController
  def login
    @user = User.find_by username: params[:username]

    if !@user or !@user.authenticate params[:password]
      render status: :unauthorized
    else
      payload = {
        user_id: @user.id
      }
      secret = Rails.application.secret_key_base
      token = JWT.encode payload, secret
      render json: { token: token }, status: :ok
    end
  end
end
