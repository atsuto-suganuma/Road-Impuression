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

    get 'search/:genre' => 'bikes#search_genre', as: 'search_genre'
  

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :makers, only: [:index, :show] do
    get 'bikes/:id' => 'bikes#show', as: 'bike_show'
      post 'bikes/:id' => 'impressions#create', as: 'impression_create'
      delete 'bikes/:bike_id/impression/:id' => 'impressions#destroy', as: 'impression_destroy'
      get 'bikes/:bike_id/impression/:id/edit' => 'impressions#edit', as: 'impression_edit'
      patch 'bikes/:bike_id/impression/:id' => 'impressions#update', as: 'impression_update'
      post 'bikes/:bike_id/favorite' => 'bike_favorites#create', as: 'bike_favorite_create'
      delete 'bikes/:bike_id/favorite' => 'bike_favorites#destroy', as: 'bike_favorite_destroy'
  end
  get 'search' => 'bikes#search_bike', as: 'search_bike'

  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]

    resources :makers do
      get 'bikes/:id' => 'bikes#show', as: 'bike_show'
      delete 'bikes/:id' => 'bikes#destroy',as: 'bike_destroy'
      get 'bikes/:id/edit' =>'bikes#edit', as: 'bike_edit'
      patch 'bikes/:id' => 'bikes#update',as: 'bike_update'
        get 'bikes/:bike_id/years_bikes/new' => 'years_bikes#new', as: 'years_bike_new'
        post 'bikes/:bike_id/years_bikes' => 'years_bikes#create', as: 'years_bike_create'
        get 'bikes/:id/years_bikes/:year/edit' => 'years_bikes#edit', as: 'years_bike_edit'
        patch 'bikes/:bike_id/years_bikes/:year' => 'years_bikes#update', as: 'years_bike_update'
        delete 'bikes/:id/years_bikes' => 'years_bikes#destroy', as: 'years_bike_destroy'
  end

    get 'search' => 'bikes#search_bike', as: 'search_bike'
    get 'bikes/new'
    post 'bikes/create'

    resources :impressions, only: [:index, :destroy]

    resources :threads, only: [:index, :show, :destroy] do
      resource :comments, only: [:destroy]
    end
  end

end
