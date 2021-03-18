Rails.application.routes.draw do
  get 'my_form/index'
  resources :my_form, only: [:index, :new, :create]
  get 'location/page'
  get 'amenities/page'
  get 'retreatdetails/page'
  get "/payments/success", to: "payments#success"
  get 'photo/page'
  devise_for :admins
  get 'listing/page'
  resources :places
  devise_for :users
  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
