class Cmsino::ContentsController < ApplicationController
  authorize_resource :class => Cmsino::Content

  def index
    @contents = Hash.new
    @locales = Cmsino::Conf.new.locales
    Cmsino::Content.order([:page, :name, :locale]).each do |c|
      @contents[c.page] ||= Hash.new
      @contents[c.page][c.name] ||= Hash.new
      @contents[c.page][c.name][c.locale] = c
    end
  end

  def new 
    @content = Cmsino::Content.new
    render :action => :edit
  end

  def create
    @content = Cmsino::Content.new(params[:cmsino_content])
    raise @content.inspect
  end

  def edit
    session[:cmsino_from] = env["HTTP_REFERER"]
    @content = Cmsino::Content.find(params[:id])
  end

  def update
    @content = Cmsino::Content.find(params[:id])
    @content.update_attribute(:text, params[:cmsino_content][:text])
    redirect_to session[:cmsino_from]
  end

end
