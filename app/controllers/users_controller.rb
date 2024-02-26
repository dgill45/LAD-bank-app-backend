class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :index, :show]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: { status: 'Created', user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

    def index
      @users = User.all
      render json: @users, except: [:password_digest, :email, :created_at, :updated_at], status: :ok
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  
  end
  