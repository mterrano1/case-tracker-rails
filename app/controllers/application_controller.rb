class ApplicationController < ActionController::API
    before_action :authenticate_user

    # Extracts the JWT token from the request header, decodes it using the JWT
    # secret, and sets the current user based on the user ID found in the decoded 
    # token. If there is a JWT decode error, it returns a 401 unauthorized response.
    def authenticate_user
        token = request.headers["Authorization"]
        begin
            decoded_token = JWT.decode(token, ENV["JWT_SECRET"], true, { algorithm: "HS256" })
            @current_user = User.find(decoded_token[0]["user_id"])
        rescue JWT::DecodeError
            render json: { errors: ["Not authorized"] }, status: :unauthorized
        end
    end

    # Rescues from ActiveRecord::RecordInvalid exceptions and 
    # returns a JSON response containing the full error messages.
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    private

    # Returns a JSON response containing the full error messages
    # when an ActiveRecord::RecordInvalid exception is raised.
    def render_unprocessable_entity_response(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
