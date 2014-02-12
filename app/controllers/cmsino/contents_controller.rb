class Cmsino::ContentsController < ApplicationController
  authorize_resource :class => Cmsino::Content

  def index
    @contents = Hash.new
    @locales = Cmsino::Conf.instance.locales
    Cmsino::Content.order([:page, :name, :locale]).each do |c|
      @contents[c.page] ||= Hash.new
      @contents[c.page][c.name] ||= Hash.new
      @contents[c.page][c.name][c.locale] = c
    end
    @last_edited = session[:cmsino_last]
  end

  def new 
    @content = Cmsino::Content.new(:page => params[:page], 
                                   :name => params[:name],
                                   :locale => params[:locale])
    @all_contents = Cmsino::Content.where(:page => @content.page, 
                                          :name => @content.name)
    render :action => :edit
  end

  # "cmsino_content"=>{"page"=>"page_name", "name"=>"content_name", "locale"=>"en", "text"=>"<p>my text</p>"}
  def create
    @content = Cmsino::Content.new(cmsino_content_params)
    session[:cmsino_last] = @content.div_id
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
    @all_contents = Cmsino::Content.where(:page => @content.page, :name => @content.name)
  end

  def update
    @content = Cmsino::Content.find(params[:id])
    session[:cmsino_last] = @content.div_id
    @content.update_attribute(:text, params[:cmsino_content][:text])
    redirect_to session[:cmsino_from]
  end

  def destroy
    @content = Cmsino::Content.find(params[:id])
    @content.destroy
    redirect_to session[:cmsino_from]
  end

  private

  def cmsino_content_params
    params.require(:cmsino_content).permit(:page, :name, :locale, :text)
  end


end
