class AccountsController < ApplicationController
    before_action :authorize, only: [:show, :update, :destroy]
    # GET /accounts
    def index
        accounts = Account.all
        render json: accounts
    end

    # POST /accounts
  def create
    account = Account.create(account_params)
    render json: account, status: :created
  end

    # GET /account/:id
    def show
        account = find_account
        if account
            render json: account
        else
            render_not_found_response
        end
    end
    
    # PATCH /account/:id
    def update
        account = find_account
        if account
            account.update(account_params)
            render json: account
        else
            render_not_found_response
        end
    end

    def destroy 
        account = find_account
        if account
          account.destroy
          head :no_content
        else
          render_not_found_response
        end
      end

      private

      def render_not_found_response
        render json: { error: "Account not found" }, status: :not_found
      end

      def find_account
        Account.find(params[:id])
      end

      def account_params
        params.permit(:account_number, :balance, :customer_id)
      end

    end

    class CustomersController < ApplicationController
    before_action :authorize, only: [:show, :update, :destroy]
    # GET /customers
    def index
        customers = Customer.all
        render json: customers
    end

    # POST /customers
  def create
    customer = Customer.create(customer_params)
    render json: customer, status: :created
  end

    # GET /customer/:id
    def show
        customer = find_customer
        if customer
            render json: customer
        else
            render_not_found_response
        end
    end
    
    # PATCH /customer/:id
    def update
        customer = find_customer
        if customer
            customer.update(customer_params)
            render json: customer
        else
            render_not_found_response
        end
    end

    def destroy 
        customer = find_customer
        if customer
          customer.destroy
          head :no_content
        else
          render_not_found_response
        end
      end

      private

      def render_not_found_response
        render json: { error: "Customer not found" }, status: :not_found
      end

      def find_customer
        Customer.find(params[:id])
      end

      def customer_params
        params.permit(:first_name, :last_name, :email, :password)
      end

    end


end
