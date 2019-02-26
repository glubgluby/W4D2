Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :cats
  resources :catrentalrequests, only: [:new, :create]
  post 'cats/catrentalrequests_url', to: 'catrentalrequests#create'
end
