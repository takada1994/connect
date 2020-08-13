Rails.application.routes.draw do
  get 'posts/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :about, to: "home#about"
  get :login, to: "home#login" , as:"login"

end
