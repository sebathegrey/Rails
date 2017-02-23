Rails.application.routes.draw do
  resources :pins
  devise_for :users
  root 'home#index'

  get 'home/about'

  get 'home/contact'

  get 'home/faq'

  mount ActionCable.server => '/cable'

 end