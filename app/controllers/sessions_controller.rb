class SessionsController < ApplicationController

    # POST /signup
    def signup
      @customer = Customer.new(customer_params)
      if @customer.save
        session[:customer_id] = @customer.id
        render json: { status: 'Created', customer: @customer }, status: :created
      else
        render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # POST /login
    def login
      @customer = Customer.find_by(email: params[:email])
      
      if @customer&.authenticate(params[:password])
        session[:customer_id] = @customer.id
        render json: { status: 'Logged in', customer: @customer }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    # DELETE /logout
    def logout
      session.delete(:customer_id)
      render json: { status: 'Logged out' }
    end
  
    private
  
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
  