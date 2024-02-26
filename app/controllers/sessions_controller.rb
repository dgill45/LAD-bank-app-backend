class SessionsController < ApplicationController
  # POST /login
  def login
    @customer = Customer.find_by(email: params[:email])

    if @customer&.authenticate(params[:password])
      session[:customer_id] = @customer.id
      render json: { status: 'Logged in', customer: @customer }
    else
      render json: { error: 'Invalid login credentials. Please try again.' }, status: :unauthorized
    end
  end
  # DELETE /logout
  def logout
    session.delete(:customer_id)
    render json: { status: "Success", message: 'You have been successfully logged out' }
  end
end
