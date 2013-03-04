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
    @content = Cmsino::Content.new(:page => params[:page], 
                                   :name => params[:name],
                                   :locale => params[:locale])
    render :action => :edit
  end

  # "cmsino_content"=>{"page"=>"page_name", "name"=>"content_name", "locale"=>"en", "text"=>"<p>my text</p>"}
  def create
    @content = Cmsino::Content.new(params[:cmsino_content])
    if @content.save
      flash_notice = "OK"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def edit
    session[:cmsino_from] = env["HTTP_REFERER"]
    @content = Cmsino::Content.find(params[:id])
    @other_contents = Cmsino::Content.where(:page => @content.page, :name => @content.name).all
  end

  def update
    @content = Cmsino::Content.find(params[:id])
    @content.update_attribute(:text, params[:cmsino_content][:text])
    redirect_to session[:cmsino_from]
  end

end
