class ApplicationController < ActionController::Base
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from User::NotAuthorized, with: :user_not_authorized

    before_action :set_current_user  
    before_action :check_session_timeout, if: -> { @current_user.present? }



    def require_login
        render json: { message: 'Please log in to continue' }, status: :unauthorized unless @current_user
    end

    private

    def set_current_user
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id].present?
    end

    def check_session_timeout
        if session[:last_seen].present? && Time.parse(session[:last_seen]) > 15.minutes.ago
        session[:last_seen] = Time.current.to_s
        else
        session.delete(:user_id)
        session.delete(:last_seen)
        render json: { error: 'Session expired. Please log in again.' }, status: :unauthorized
        end
    end
    
    def record_not_found
        render json: { error: 'Resource not found' }, status: :not_found
    end

    def parameter_missing(exception)
        render json: { error: exception.message }, status: :bad_request
    end

    def user_not_authorized
        render json: { error: 'Not authorized' }, status: :unauthorized
    end
end
