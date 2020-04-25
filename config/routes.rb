Rails.application.routes.draw do
	devise_for :users
	root 'homes#top'
	get 'home/about' => 'homes#about'

	resources :books, only: [:new, :index, :create, :edit, :show, :destroy, :update]
	resources :users, only: [:edit, :index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
