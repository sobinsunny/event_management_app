Rails.application.routes.draw do
  resources :users
  root 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy'
  resources :events
  resources :sessions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
