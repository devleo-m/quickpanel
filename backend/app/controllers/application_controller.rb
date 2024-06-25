class ApplicationController < ActionController::Base
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JWT.decode(header, Rails.application.secret_key_base, true, { algorithm: 'HS256' })
      @current_user = User.find(decoded[0]['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
