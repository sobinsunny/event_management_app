Rails.application.routes.draw do
  resources :users
  root 'home#index'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  resources :events do
    member do
      post :set_user_event
      delete :remove_user_event
    end
  end
  resource :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
