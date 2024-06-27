class LogosController < ApplicationController
  before_action :require_admin

  def create
    @logo = Logo.new(logo_params)

    if @logo.save
      render json: @logo, status: :created
    else
      render json: @logo.errors, status: :unprocessable_entity
    end
  end

  private

  def logo_params
    params.require(:logo).permit(:image_url)
  end
end
