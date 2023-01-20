class ApplicationController < ActionController::API
    before_action :authenticate_user

    def authenticate_user
        token = request.headers["Authorization"]
        blacklisted_token = Blacklist.find_by(jti: token)
        if blacklisted_token
            render json: { errors: ["Not authorized"] }, status: :unauthorized
        else
            begin
                decoded_token = JWT.decode(token, ENV["JWT_SECRET"], true, { algorithm: "HS256" })
                @current_user = User.find(decoded_token[0]["user_id"])
            rescue JWT::DecodeError
                render json: { errors: ["Not authorized"] }, status: :unauthorized
            end
        end
    end

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    private

    def render_unprocessable_entity_response(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
