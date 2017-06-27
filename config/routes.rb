Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents do
      resources :media do 
        put :toggle, on: :member
      end
      resources :media_uses
    end
    resources :media

    resources :pages
    resources :posts
    resources :media_uses
  end
end
