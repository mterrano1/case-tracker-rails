class UsersController < ApplicationController
    
    #POST /signup
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    #GET /me
    def show
        render json: @current_user
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :role, :username, :password, :password_confirmation)
    end
end
