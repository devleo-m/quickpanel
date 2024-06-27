class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:update, :me]

  def create
    @user = User.new(user_params)
    @user.role = Role.find_by(name: 'leitor') # Definindo o papel como leitor por padrão

    if @user.save
      session[:user_id] = @user.id
      render json: { message: 'Usuário criado com sucesso', user: @user }, status: :created
    else
      Rails.logger.error("Erro ao criar usuário: #{@user.errors}")
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render json: { message: 'Dados atualizados com sucesso', user: @user }, status: :ok
    else
      Rails.logger.error("Erro ao atualizar usuário: #{@user.errors}")
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

  def require_login
    unless logged_in?
      render json: { error: 'Você deve estar logado para acessar esta seção' }, status: :unauthorized
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
