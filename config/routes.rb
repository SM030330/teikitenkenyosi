Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :main do
    get '/', to: 'home#index'
    get 'index', to: 'home#index'
  end
end
