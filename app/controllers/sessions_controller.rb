class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login, :logout]
  # POST /login
  def login
    Rails.logger.info "Attempting to log in with email: #{params[:email]}"
    @customer = Customer.find_by(email: params[:email])

    if @customer&& @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id
      render json: { status: 'Logged in', customer: @customer }
    else
      render json: { error: 'Invalid login credentials. Please try again.' }, status: :unauthorized
    end
  rescue BCrypt::Errors::InvalidHash
    render json: { error: 'Invalid password encoding. Please reset your password.' }, status: :unprocessable_entity
  end

  # GET /logged_in
def is_logged_in?
  if session[:customer_id]
    @customer = Customer.find(session[:customer_id])
    render json: { logged_in: true, customer: @customer }
  else
    render json: { logged_in: false }
  end
end

  # DELETE /logout
  def logout
    session.delete(:customer_id)
    render json: { status: "Success", message: 'You have been successfully logged out' }
  end
end
