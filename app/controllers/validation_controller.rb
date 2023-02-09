# class ValidationController < ApplicationController
#     skip_before_action :authenticate_user

#     def validate
#         token = request.headers["Authorization"]
#         begin
#             decoded_token = JWT.decode(token, ENV["JWT_SECRET"], true, { algorithm: "HS256" })
#             user_id = decoded_token[0]["user_id"]
#             user = User.find(user_id)
#             render json: { user: user }, status: :ok
#         rescue JWT::DecodeError
#             render json: { errors: ["Not authorized"] }, status: :unauthorized
#         end
#     end
# end
