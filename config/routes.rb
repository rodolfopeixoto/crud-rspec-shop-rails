Rails.application.routes.draw do

  resources :customers, only: [:index, :new, :create, :show, :edit, :update]

  root to: 'welcome#index'
end
