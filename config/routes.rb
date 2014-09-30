Rails.application.routes.draw do
  root :to => 'photos#index'
  get "show" => "photos#show", :as => :photo
  
end
