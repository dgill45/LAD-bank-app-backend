class ApplicationController < ActionController::Base
include ActionController::Cookies

before_action :set_current_user

def set_current_user
    if session[:user_id] && session[:last_seen] > 30.minutes.ago
      @current_user = User.find_by(id: session[:user_id])
      session[:last_seen] = Time.current
    else
      session.delete(:user_id)
      render json: { error: 'Session expired. Please log in again.' }, status: :unauthorized
    end
  end

def require_login
    render json: { message: 'Please log in to continue' }, status: :unauthorized unless @current_user
end
