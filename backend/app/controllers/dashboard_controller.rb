class DashboardController < ApplicationController
  before_action :require_admin

  def index
    render json: { message: 'Bem-vindo ao Dashboard' }, status: :ok
  end

  private

  def require_admin
    unless current_user&.role&.name == 'admin'
      render json: { error: 'Acesso negado' }, status: :forbidden
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
