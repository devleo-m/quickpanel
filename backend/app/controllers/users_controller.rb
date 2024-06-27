class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authorize_request, only: [:create]

  def create
    logger.debug "Iniciando criação de usuário"
    @user = User.new(user_params)
    logger.debug "Parametros do usuário: #{@user.inspect}"

    @user.role = Role.find_by(name: 'leitor') # Usuário padrão é leitor
    logger.debug "Definindo papel do usuário: #{@user.role.inspect}"

    if @user.save
      logger.debug "Usuário salvo com sucesso"
      payload = { user_id: @user.id, exp: 24.hours.from_now.to_i }
      token = JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
      render json: { message: 'Usuário criado com sucesso', email: @user.email, role: @user.role.name, token: token }, status: :created
    else
      logger.debug "Falha ao salvar usuário: #{@user.errors.full_messages}"
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render json: { message: 'Dados atualizados com sucesso', user: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def me
    render json: current_user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
