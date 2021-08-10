Rails.application.routes.draw do
  # devise_for :students
  namespace :v1 do
    resources :subjects
    resources :clockings
    resources :sessions, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
