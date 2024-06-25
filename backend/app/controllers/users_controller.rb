class UsersController < ApplicationController
  before_action :require_login, only: [:update, :me]

  def create
    @user = User.new(user_params)
    @user.role = Role.find_by(name: 'leitor') # Usuário padrão é leitor

    if @user.save
      session[:user_id] = @user.id
      render json: { message: 'Usuário criado com sucesso', user: @user }, status: :created
    else
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
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :phone)
  end

  def require_login
      render json: {
        error: 'Você deve estar logado para acessar esta seção' },
             status: :unauthorized unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end