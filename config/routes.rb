# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :events
  resources :group_events, except: [:destroy]
  resources :users, only: [:index, :show, :create]
end
