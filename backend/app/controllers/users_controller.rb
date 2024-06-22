class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = Role.find_by(name: 'leitor') # Usuário padrão é leitor

    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user), notice: 'Usuário criado com sucesso'
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'Dados atualizados com sucesso'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :phone)
  end

  def require_login
    unless logged_in?
      flash[:alert] = 'Você deve estar logado para acessar esta seção'
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end