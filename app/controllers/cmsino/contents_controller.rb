class Cmsino::ContentsController < ApplicationController

  def index
    @contents = Cmsino::Content.all
  end

  def edit
    @content = Cmsino::Content.find(params[:id])
    authorize! :update, @content
  end

  def update
    @content = Cmsino::Content.find(params[:id])
    @content.update_attribute(:text, params[:cmsino_content][:text])
    redirect_to page_path(@content.page)
  end

end
