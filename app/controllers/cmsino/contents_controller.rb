class Cmsino::ContentsController < ApplicationController
  layout 'cmsino/layouts/cmsino'
  authorize_resource :class => Cmsino::Content

  def index
    @contents = Hash.new
    @locales = Cmsino::Conf.instance.locales
    Cmsino::Content.order([:umbrella, :name, :locale]).each do |content|
      @contents[content.umbrella] ||= Hash.new
      @contents[content.umbrella][content.name] = Hash.new
      @contents[content.umbrella][content.name][content.locale] = content
    end
    @last_edited = session[:cmsino_last]
  end

  def new 
    if params[:post]
      @content = Cmsino::Post.new(umbrella: params[:umbrella], 
                                  name:     params[:name],
                                  locale:   params[:locale])
    else
      @content = Cmsino::Content.new(umbrella: params[:umbrella], 
                                     name:     params[:name],
                                     locale:   params[:locale])
    end

    @all_locales = Cmsino::Content.where(umbrella: @content.umbrella, 
                                         name:     @content.name)
    render :action => :edit
  end

  # "cmsino_content"=>{"umbrella"=>"page_name", "name"=>"content_name", "locale"=>"en", "text"=>"<p>my text</p>"}
  def create
    if params[:cmsino_post]
      @content = Cmsino::Post.new(cmsino_content_params)
    else
      @content = Cmsino::Content.new(cmsino_content_params)
    end
    session[:cmsino_last] = @content.div_id
    if @content.save
      redirect_to action: :index, notice: 'OK'
    else
      render action: :edit
    end
  end

  def edit
    session[:cmsino_from] = env["HTTP_REFERER"]
    @content = Cmsino::Content.find(params[:id])
    @all_locales = Cmsino::Content.where(:umbrella => @content.umbrella, :name => @content.name)
  end

  def update
    @content = Cmsino::Content.find(params[:id])
    session[:cmsino_last] = @content.div_id
    @content.update_attributes(cmsino_content_params)
    redirect_to session[:cmsino_from]
  end

  def destroy
    @content = Cmsino::Content.find(params[:id])
    if @content.destroy
      flash[:notice] = "OK"
    else
      flash[:error] = "Error"
    end
    redirect_to session[:cmsino_from]
  end

  private

  def cmsino_content_params
    (params[:cmsino_content] || params[:cmsino_post]).permit(:umbrella, :date, :title, :name, :locale, :text)
  end

  def cmsino_text
    (params[:cmsino_content] || params[:cmsino_post])[:text]
  end

end
