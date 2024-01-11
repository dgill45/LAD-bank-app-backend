class AccountsController < ApplicationController
    before_action :set_customer
    #before_action :authorize, only: [:show, :update, :destroy]
    # GET customers/:customer_id/accounts
    def index
      accounts = @customer.accounts
      render json: accounts
    end

    # POST customers/:customer_id/accounts
    def create
      account = @customer.accounts.create(account_params)
      render json: account, status: :created
    end

    # GET customers/:customer_id/accounts/:id
    def show
      find_account
      if @account
          render json: @account
      else
          render_not_found_response
      end
    end
    
    # PATCH customers/:customer_id/account/:id
    def update
      find_account
        if @account
           account.update(account_params)
           render json: account
        else
            render_not_found_response
        end
    end

    # DELETE customers/:customer_id/account/:id
    def destroy 
      find_account
      if account
        account.destroy
        head :no_content
      else
        render_not_found_response
      end
    end

      private

      def set_customer
        @customer = Customer.find(params[:customer_id])
      rescue ActiveRecord::RecordNotFound
        render_not_found_response('Customer')
      end

      def render_not_found_response
        render json: { error: "Account not found" }, status: :not_found
      end

      def find_account
        @account = @customer.accounts.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_not_found_response('Account')
      end

      def account_params
        params.permit(:account_number, :balance, :account_type)
      end

    end

    
