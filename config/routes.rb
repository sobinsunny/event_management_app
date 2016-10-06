# == Route Map
#
#                  Prefix Verb   URI Pattern                             Controller#Action
#                   users GET    /users(.:format)                        users#index
#                         POST   /users(.:format)                        users#create
#                new_user GET    /users/new(.:format)                    users#new
#               edit_user GET    /users/:id/edit(.:format)               users#edit
#                    user GET    /users/:id(.:format)                    users#show
#                         PATCH  /users/:id(.:format)                    users#update
#                         PUT    /users/:id(.:format)                    users#update
#                         DELETE /users/:id(.:format)                    users#destroy
#                    root GET    /                                       home#index
#                   login GET    /login(.:format)                        sessions#new
#                  logout GET    /logout(.:format)                       sessions#destroy
#    set_user_event_event POST   /events/:id/set_user_event(.:format)    events#set_user_event
# remove_user_event_event DELETE /events/:id/remove_user_event(.:format) events#remove_user_event
#                  events GET    /events(.:format)                       events#index
#                         POST   /events(.:format)                       events#create
#               new_event GET    /events/new(.:format)                   events#new
#              edit_event GET    /events/:id/edit(.:format)              events#edit
#                   event GET    /events/:id(.:format)                   events#show
#                         PATCH  /events/:id(.:format)                   events#update
#                         PUT    /events/:id(.:format)                   events#update
#                         DELETE /events/:id(.:format)                   events#destroy
#                sessions POST   /sessions(.:format)                     sessions#create
#

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
