Rails.application.routes.draw do
  resources :photos
  root 'photos#index'

  post '/email' => 'griddler/emails#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
