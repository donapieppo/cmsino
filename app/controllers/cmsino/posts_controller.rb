class Cmsino::PostsController < Cmsino::ContentsController
  layout 'cmsino/layouts/cmsino'
  authorize_resource :class => Cmsino::Content

  def index
    @posts = Cmsino::Post.all
  end

  def new
    @content = Cmsino::Post.new(umbrella: params[:umbrella], 
                                name:     params[:name],
                                locale:   params[:locale])
    render 'cmsino/contents/edit'
  end

  def create
    @content = Cmsino::Post.new(cmsino_post_params)
    session[:cmsino_last] = @content.div_id
    if @content.save
      redirect_to action: :index, notice: 'OK'
    else
      render action: :new
    end
  end

  private

  def cmsino_post_params
    params[:cmsino_post].permit(:umbrella, :title, :name, :locale, :text)
  end
end

