Rails.application.routes.draw do
  root to: 'main/home#index'

  namespace :main do
    get '/', to: 'home#index'
    get 'index', to: 'home#index'
    post 'item_change_doing', to: 'items#update_doing'
    get 'inspection/edit_destroy/:id', to: 'inspections#edit_destroy', as: :inspection_edit_destroy
    get 'home/confirm', to: 'home#confirm', ad: :home_confirm
    resources :inspections, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :items, only: [:edit, :update]

    devise_for :users, controllers: { registrations: "main/users/registrations",
                                      sessions: "main/users/sessions",
                                      passwords: "main/users/passwords"}
    namespace :users do
      resources :users, :only => [:show]
    end

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
  end  
end
