Rails.application.routes.draw do
  root "posts#top"
  
  resources :posts, only: [:new, :index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
