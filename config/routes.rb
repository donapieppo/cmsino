Rails.application.routes.draw do
  namespace :cmsino do 
    resources :contents
  end
end
