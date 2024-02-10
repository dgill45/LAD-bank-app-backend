class SessionsController < ApplicationController
  # POST /login
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { status: 'Logged in', user: @user, role: @user.role_type }
    else
      render json: { error: 'Invalid login credentials. Please try again.' }, status: :unauthorized
    end
  end
  # DELETE /logout
  def logout
    session.delete(:user_id)
    render json: { status: "Success", message: 'You have been successfully logged out' }
  end
end
