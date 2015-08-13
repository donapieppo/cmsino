Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents do
      resources :media
      resources :media_uses
    end
    resources :media 
    resources :pages
    resources :posts
    resources :media_uses
  end
end
