class BannersController < ApplicationController
  before_action :require_admin

  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      render json: @banner, status: :created
    else
      render json: @banner.errors, status: :unprocessable_entity
    end
  end

  private

  def banner_params
    params.require(:banner).permit(:image_url)
  end
end
