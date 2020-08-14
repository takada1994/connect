Rails.application.routes.draw do
  get 'posts/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :about, to: "home#about"
  get :login, to: "home#login" , as:"login"

  get "posts/:id" => "posts#show"
  get :new, to: "posts#new"
  post "posts/create" => "posts#create"
end
