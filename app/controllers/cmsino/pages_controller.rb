class Cmsino::PagesController < Cmsino::ContentsController
  layout 'cmsino/layouts/cmsino'
  authorize_resource class: Cmsino::Content

  before_action :available_locales

  def index
    @contents_hash = Hash.new
    Cmsino::Content.order([:umbrella, :name, :locale]).each do |content|
      @contents_hash[content.umbrella] ||= Hash.new
      @contents_hash[content.umbrella][content.name] ||= Hash.new
      @contents_hash[content.umbrella][content.name][content.locale] = content
    end
    @last_edited = session[:cmsino_last]
  end

end


