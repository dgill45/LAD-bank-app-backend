class CustomersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
      # before_action :authorize, only: [:show, :update, :destroy]
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
