Rails.application.routes.draw do
  get 'photo/page'
  devise_for :admins
  get 'listing/page'
  resources :places
  devise_for :users
  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
