class Cmsino::PostsController < Cmsino::ContentsController
  layout 'cmsino/layouts/cmsino'
  authorize_resource :class => Cmsino::Content

  def index
    @posts = Cmsino::Post.order(:umbrella, :date)
  end

end

