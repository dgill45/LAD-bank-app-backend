class HomeController < ApplicationController
    def index
        render json: { message: 'Welcome to the LAD Bank' }
    end
end
