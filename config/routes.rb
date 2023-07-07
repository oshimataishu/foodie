Rails.application.routes.draw do

  devise_for :admins, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post 'guest_login' => 'public/sessions#guest_login'
  end


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resource :user, only: [:show, :edit, :update, :index]
    resources :shops do
      collection do
        get 'search'
      end
    end
  end
end

