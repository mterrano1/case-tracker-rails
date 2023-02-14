class UsersController < ApplicationController
    # Skip authentication before creating a user to allow non-authenticated users to create an account.
    skip_before_action :authenticate_user, only: :create

    # Creates a new user with the given user parameters and returns a JWT token.
    def create
        user = User.create!(user_params)
        # Generate a JWT token with the user id and expiration time(5 hours).
        payload = { user_id: user.id, exp: Time.now.to_i + 18000 }
        token = JWT.encode(payload, ENV["JWT_SECRET"], "HS256")
        render json: { token: token }, status: :created
    end

    # Retrieves all users with the "Researcher" role.
    def index
        researcher = User.where(role: "Researcher")
        render json: researcher
    end

    # Retrieves the user associated with the JWT token.
    def show
        render json: @current_user
    end

    private

    # Defines the permitted parameters for a user.
    def user_params
        params.permit(:first_name, :last_name, :role, :username, :password, :password_confirmation)
    end
end
