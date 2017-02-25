Rails.application.routes.draw do
  resources :my_lists
  resources :lists
  root 'home#index'

  get 'home/about'

  get 'home/contact'

  get 'home/faq'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
