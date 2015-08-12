Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents
    resources :posts
    resources :media
  end
end
