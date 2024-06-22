class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

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
end
