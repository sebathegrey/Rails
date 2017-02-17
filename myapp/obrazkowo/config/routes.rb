Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'home/about'

  get 'home/contact'

  get 'home/faq'

 end