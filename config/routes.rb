Rails.application.routes.draw do
  resources :favorites
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :events do
  	put :favorite, on: :member
  	put :rsvp, on: :member
  end

  root :to => 'events#index'

  
end
