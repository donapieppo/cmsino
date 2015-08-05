Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents
    resources :posts
    resources :image_contents
  end
end
