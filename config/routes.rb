Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  get 'users/index'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get :about, to: "home#about"

  resources :posts 

  resources :users, except: %i[new]
  get :signup, to: "users#new"

  resource :session, only:[:create , :destroy]

  resources :account, only: [:show, :edit, :update]

end
