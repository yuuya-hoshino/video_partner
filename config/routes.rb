Rails.application.routes.draw do
  get 'members/index'
  get "/" => "home#top"
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:index, :show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
