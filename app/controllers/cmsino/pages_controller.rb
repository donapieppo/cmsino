class Cmsino::PagesController < Cmsino::ContentsController
  layout 'cmsino/layouts/cmsino'
  authorize_resource :class => Cmsino::Content

  def index
    @contents = Hash.new
    @locales = Cmsino::Conf.instance.locales
    Cmsino::Content.order([:umbrella, :name, :locale]).where("type <> 'Cmsino::Post' or type is null").each do |content|
      @contents[content.umbrella] ||= Hash.new
      @contents[content.umbrella][content.name] = Hash.new
      @contents[content.umbrella][content.name][content.locale] = content
    end
    @last_edited = session[:cmsino_last]
  end
end


