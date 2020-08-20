Rails.application.routes.draw do
  get 'users/index'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get :about, to: "home#about"

  resources :posts 

  resources :users, except: %i[new]
  get "signup" => "users#new"

end
