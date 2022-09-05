Rails.application.routes.draw do
  root to: 'main/home#index'

  namespace :main do
    get '/', to: 'home#index'
    get 'index', to: 'home#index'

    devise_for :users, controllers: { registrations: "users/registrations",
                                      sessions: "users/sessions"}
  end  
end
