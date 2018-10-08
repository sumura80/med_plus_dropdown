Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do 
  	resources :comments
  end

  #userのshowページ作成URL
  resources :users, only:[:show]
  root 'posts#index'
end
