class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
      token = JWT.encode(payload, Rails.application.secret_key_base, 'HS256')

      render json: {
        message: 'Login bem-sucedido',
        email: user.email,
        role: user.role.name,
        token: token
      }, status: :ok

    else
      render json: { error: 'Email ou senha inválidos' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logout realizado com sucesso' }, status: :ok
  end
end
