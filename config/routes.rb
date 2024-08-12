Rails.application.routes.draw do
  devise_for :users
  root "posts#top"
  
  resources :posts do
    resource :favorite, only: [:create, :destroy]
    post "/", to: "comments#create", as: "comments"
    resources :comments, only: [:destroy]
    collection do
      get "search"
    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
