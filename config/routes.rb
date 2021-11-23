Rails.application.routes.draw do
  namespace :v1 do
    resources :students, only: [:create]
    resources :subjects, only: [:index, :create, :show]
    resources :clockings, only: [:create, :show, :update, :destroy]
    post "/login", to: "authentication#login"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
