Rails.application.routes.draw do

  resources :customers, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  root to: 'welcome#index'
end
