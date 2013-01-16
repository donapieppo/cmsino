class Cmsino::ImageContentsController < Cmsino::ContentsController

  def update
    @content = Cmsino::Content.find(params[:id])
    @content.update_attributes(:text => params[:cmsino_image_content][:text], 
                               :title => params[:cmsino_image_content][:title])
    redirect_to session[:cmsino_from]
  end

end
