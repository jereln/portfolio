Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root 'welcome#index'

  resources :articles do
    resources :comments 
  end
  resources :projects
end
