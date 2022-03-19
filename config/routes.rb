Rails.application.routes.draw do
   
  devise_for :users
  resources :movies do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index]
    resources :likes, only: [:create]
    post "/rate", to: "movies#rate"
  end

  resources :likes, only: [:destroy]
  root 'movies#index'
end
