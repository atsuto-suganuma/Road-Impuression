Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#top'
  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]

    resources :makers do
      resource :bikes, only:[:index, :show, :destroy]
    end

    get 'bikes/new'
    post 'bikes/create'
    get 'bikes/edit'
    put 'bikes/update'

    resources :impressions, only: [:index, :destroy]

    resources :threads, only: [:index, :show, :destroy] do
      resource :comments, only: [:destroy]
    end
  end

end
