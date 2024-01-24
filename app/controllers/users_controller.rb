class UsersController < ApplicationController

    def signup
      role = create_role(params[:role_type])
      return render json: { errors: role.errors.full_messages }, status: :unprocessable_entity unless role&.valid?
  
      @user = User.new(user_params.merge(role: role))
      if @user.save
        session[:user_id] = @user.id
        render json: { status: 'Created', user: @user, role: params[:role_type] }, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def create_role(role_type)
      case role_type
      when 'admin'
        Admin.new(admin_params)
      when 'customer'
        Customer.new(customer_params)
      else
        nil # or handle unknown role type
      end
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def admin_params
      # Adjust these attributes as per your Admin model
      params.require(:admin).permit(:first_name, :last_name)
    end
  
    def customer_params
      # Adjust these attributes as per your Customer model
      params.require(:customer).permit(:first_name, :last_name)
    end
  end
  