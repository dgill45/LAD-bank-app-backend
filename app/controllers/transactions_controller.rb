class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    before_action :set_customer
    before_action :set_account
    #before_action :authorize, only: [:show, :update, :destroy]
    # GET /customers/:customer_id/accounts/:account_id/transactions
    def index
      transactions = @account.transactions
      render json: transactions
    end

    # POST /customers/:customer_id/accounts/:account_id/transactions
  def create
    transaction = @account.transactions.create(transaction_params)
    render json: transaction, status: :created
  end

    # GET /customers/:customer_id/accounts/:account_id/transactions/:transaction_id
    def show
      find_transaction
        if @transaction
            render json: @transaction
        else
            render_not_found_response
        end
    end
    
    # PATCH /customers/:customer_id/accounts/:account_id/transactions/:transaction_id
    def update
      find_transaction
        if @transaction
            transaction.update(transaction_params)
            render json: @transaction
        else
            render_not_found_response
        end
    end

    # DELETE /customers/:customer_id/accounts/:account_id/transactions/:transaction_id
    def destroy 
      find_transaction
        if @transaction
          transaction.destroy
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

      def set_account
        @account = @customer.accounts.find(params[:account_id])
      rescue ActiveRecord::RecordNotFound
        render_not_found_response('Account')
      end

      def render_not_found_response(entity)
        render json: { error: "#{entity} not found" }, status: :not_found
      end

      def find_transaction
        @transaction = @account.transactions.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render_not_found_response('Transaction')
      end

      def transaction_params
        params.permit(:transaction_type, :amount, :date)
      end
end
