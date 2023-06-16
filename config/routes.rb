Rails.application.routes.draw do

  namespace :public do
    root to: 'homes#top'
    get 'homes/about'
    devise_for :users
    resources :shops
  end
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
