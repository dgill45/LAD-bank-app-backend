class TransactionsController < ApplicationController
    before_action :authorize, only: [:show, :update, :destroy]
    # GET /transactions
    def index
        transactions = Transaction.all
        render json: transactions
    end

    # POST /transactions
  def create
    transaction = Transaction.create(transaction_params)
    render json: transaction, status: :created
  end

    # GET /transaction/:id
    def show
        transaction = find_transaction
        if transaction
            render json: transaction
        else
            render_not_found_response
        end
    end
    
    # PATCH /transaction/:id
    def update
        transaction = find_transaction
        if transaction
            transaction.update(transaction_params)
            render json: transaction
        else
            render_not_found_response
        end
    end

    def destroy 
        transaction = find_transaction
        if transaction
          transaction.destroy
          head :no_content
        else
          render_not_found_response
        end
      end

      private

      def render_not_found_response
        render json: { error: "Transaction not found" }, status: :not_found
      end

      def find_transaction
        Transaction.find(params[:id])
      end

      def transaction_params
        params.permit(:account_id, :transaction_type, :amount, :date)
      end
end
