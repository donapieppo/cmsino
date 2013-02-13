class Cmsino::ContentsController < ApplicationController
  load_and_authorize_resource :class => Cmsino::Content

  def index
    # authorize! :index, Cmsino::Content
    @contents = Hash.new
    Cmsino::Content.order([:page, :name, :locale]).each do |c|
      @contents[c.page] ||= Hash.new
      @contents[c.page][c.name] ||= Hash.new
      @contents[c.page][c.name][c.locale] = c
    end
  end

  def edit
    session[:cmsino_from] = env["HTTP_REFERER"]
    @content = Cmsino::Content.find(params[:id])
    authorize! :update, @content
  end

  def update
    @content = Cmsino::Content.find(params[:id])
    @content.update_attribute(:text, params[:cmsino_content][:text])
    redirect_to session[:cmsino_from]
  end

end
