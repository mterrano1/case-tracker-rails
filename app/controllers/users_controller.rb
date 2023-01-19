class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    #POST /signup
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def index
        researcher = User.where(role: "Researcher")
        render json: researcher
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
