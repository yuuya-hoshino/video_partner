Rails.application.routes.draw do
  # get 'users/edit'
  get "/" => "home#top"
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:index, :show, :edit]
  post "users/:id/update" => "users#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
