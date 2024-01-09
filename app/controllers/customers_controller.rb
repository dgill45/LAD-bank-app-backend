class CustomersController < ApplicationController
    def index
        customer = Customer.all
        render json: customer
    end

    def show
        Customer = Customer.find(params[:id])
        if customer
            render json: customer
        else
            render json: { error: 'Customer not found' }, status: :not_found
        end
    end

    
    # PATCH /customer/:id
    def update
        customer = Customer.find_by(id: params[:id])
        if customer
        customer.update(customer_params)
        render json: customer
        else
        render json: { error: "Customer not found" }, status: :not_found
        end
    end


end
