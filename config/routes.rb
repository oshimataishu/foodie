Rails.application.routes.draw do
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end

  devise_for :admins, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    resources :users
    resources :shops do
      collection do
        get 'seach'
      end
    end
  end
end

