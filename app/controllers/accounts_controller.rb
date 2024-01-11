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

    
