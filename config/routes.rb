Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'homes#top'
  get "/about", to: "homes#about"

  scope module: :public do
    patch '/users/:id/withdraw', to: 'users#withdraw', as: "withdraw"
    resources :users, except: [:new, :create]
    resources :schedules, only: [:create, :update, :destroy]
    resources :groups, except: [:new] do
      resource :group_users, only: [:create, :destroy]
      resources :chats, only: [:create]
      resources :group_schedules, only: [:create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
