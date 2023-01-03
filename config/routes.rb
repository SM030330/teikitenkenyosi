Rails.application.routes.draw do
  root to: 'main/home#index'

  namespace :main do
    get '/', to: 'home#index'
    get 'index', to: 'home#index'
    resources :inspections, only: [:index, :create, :edit, :destroy]

    devise_for :users, controllers: { registrations: "main/users/registrations",
                                      sessions: "main/users/sessions",
                                      passwords: "main/users/passwords"}
  end  
end
