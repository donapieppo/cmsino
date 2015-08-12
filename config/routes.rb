Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents do
      resources :media
    end
    resources :media 
    resources :posts
  end
end
