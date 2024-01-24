class SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { status: 'Logged in', user: @user, role: @user.role_type }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    session.delete(:user_id)
    render json: { status: 'Logged out' }
  end
end
