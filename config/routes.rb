Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :articles do
    resources :comments end
  resources :projects
end
