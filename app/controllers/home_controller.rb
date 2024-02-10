class HomeController < ApplicationController
    def index
        render json: { message: 'Welcome to the Bank API' }
    end
end
