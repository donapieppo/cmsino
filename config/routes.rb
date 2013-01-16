Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents
    resources :image_contents
  end
end
