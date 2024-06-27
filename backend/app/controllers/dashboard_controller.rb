class DashboardController < ApplicationController
  before_action :require_admin

  def index
    render json: { message: 'Bem-vindo ao Dashboard' }, status: :ok
  end

  private

  def require_admin
    Rails.logger.info "Verificando papel do usuário: #{current_user&.role&.name}"
    if current_user
      Rails.logger.info "Usuário logado: #{current_user.email} com papel: #{current_user.role.name}"
    else
      Rails.logger.warn "Nenhum usuário logado."
    end

    unless current_user&.role&.name == 'admin'
      Rails.logger.warn "Acesso negado para o usuário com email: #{current_user&.email}"
      render json: { error: 'Acesso negado' }, status: :forbidden
    end
  end
end
