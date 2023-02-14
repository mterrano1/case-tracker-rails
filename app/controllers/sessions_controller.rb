class SessionsController < ApplicationController
    # Skip authentication to allow non-authenticated users to login.
    skip_before_action :authenticate_user, only: :create

    # Creates a new user with the given user parameters and returns a JWT token.
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            # Generate a JWT token with the user id and expiration time(5 hours).
            payload = { user_id: user.id, exp: Time.now.to_i + 18000 }
            token = JWT.encode(payload, ENV["JWT_SECRET"], "HS256")
            render json: { token: token, user: user }
        else
            render json: { error: ["Invalid username or password"] }, status: :unauthorized
        end
    end
end
