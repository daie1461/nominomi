Rails.application.routes.draw do
  devise_for :users
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

   get 'nominomis/seibu' => 'nominomis#seibu'
   get 'nominomis/tobu' => 'nominomis#tobu'
   get 'nominomis/fukutoshin' => 'nominomis#fukutoshin'
   get 'nominomis/toshin' => 'nominomis#toshin'


  resources :nominomis do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end




  root 'nominomis#index'


end




