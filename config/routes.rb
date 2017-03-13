Rails.application.routes.draw do
  # devise_for :users
  resources :activities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'activities#index'

 devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, skip: [:sessions]
 as :user do
   get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
   post 'sign_in', to: 'devise/sessions#create', as: :user_session
   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
 end
end
