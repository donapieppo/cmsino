class Cmsino::MediaUsesController < ApplicationController
  layout 'cmsino/layouts/cmsino'
  authorize_resource :class => Cmsino::Content

  def new
    @medium = Cmsino::Medium.find(params[:medium_id])
    @content = Cmsino::Content.find(params[:content_id])
    @content.cmsino_media << @medium
    redirect_to [:edit, @content]
  end

  def destroy
    media_use = Cmsino::MediaUse.find params[:id]
    media_use.delete
    redirect_to [:edit, media_use.cmsino_content]
  end
end

