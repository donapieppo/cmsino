class Cmsino::MediaController < ApplicationController
  layout 'cmsino/layouts/cmsino'
  authorize_resource :class => Cmsino::Medium

  before_action :get_media, only: [:edit, :update, :destroy]

  def index
    @media = Cmsino::Medium.order(:name)
  end

  def new
    @medium = Cmsino::Medium.new
  end

  def create
    @medium = Cmsino::Medium.new(medium_params)
    if @medium.save
      redirect_to cmsino_media_path, notice: 'file uploaded'
    else
      render action: :edit
    end
  end

  def destroy
    @media.destroy
    redirect_to cmsino_media_path
  end

  private

  def medium_params
    params[:cmsino_medium].permit(:name, :attach)
  end

  def get_media
    @media = Cmsino::Medium.find(params[:id])
  end
end

