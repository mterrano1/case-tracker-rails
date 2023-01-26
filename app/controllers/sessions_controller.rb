class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: :create

    #POST /login
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            payload = { user_id: user.id, exp: Time.now.to_i + 7200 }
            token = JWT.encode(payload, ENV["JWT_SECRET"], "HS256")
            render json: { token: token, user: user }
        else
            render json: { error: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    #DELETE /logout
    def destroy
        token = request.headers["Authorization"]
        head :no_content
    end
end
