Rails.application.routes.draw do
  root :to => 'flickr#index'
  resources :flickr
end
