Rails.application.routes.draw do
	devise_for :users
	resources :books, only: [:new, :index, :create, :edit, :show]
	resources :users, only: [:edit, :index, :show, :update]
  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
