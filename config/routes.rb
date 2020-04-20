Rails.application.routes.draw do
	resources :books, only: [:new, :index, :create, :edit, :show]
	resources :users
  devise_for :users
  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
