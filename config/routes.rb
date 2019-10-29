Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
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

    get 'users/withdraw' => 'users#withdraw', as: 'withdraw'
    get 'users/unsubscribe' => 'users#unsubscride', as: 'unsubscride'
    get 'about', to: 'root#about'
    get 'privacy_policy',to:'root#privacy_policy'
    get 'terms_of_service', to: 'root#terms_of_service'
    get 'complited', to: 'contacts#complited', as: 'complited'
  resources :contacts, only:[:new, :create]

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :makers, only: [:index, :show] do
    resources :maker_favorites, only:[:create, :destroy]

    resources :bikes, only:[:show] do
      resources :impressions, only:[:create, :destroy, :edit, :update]
      resource :bike_favorites, only:[:create, :destroy]
    end
  end
  get 'search' => 'bikes#search_bike', as: 'search_bike'

    if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admin do
    resources :users, only: [:index, :show, :update, :destroy]

    resources :makers do
      get 'bikes/:id' => 'bikes#show', as: 'bike_show'
      delete 'bikes/:id' => 'bikes#destroy',as: 'bike_destroy'
      get 'bikes/:id/edit' =>'bikes#edit', as: 'bike_edit'
      patch 'bikes/:id' => 'bikes#update',as: 'bike_update'
        get 'bikes/:bike_id/years_bikes/new' => 'years_bikes#new', as: 'years_bike_new'
        post 'bikes/:bike_id/years_bikes' => 'years_bikes#create', as: 'years_bike_create'
        get 'bikes/:bike_id/years_bikes/:id/:year/edit' => 'years_bikes#edit', as: 'years_bike_edit'
        patch 'bikes/:bike_id/years_bikes/:id/:year' => 'years_bikes#update', as: 'years_bike_update'
        delete 'bikes/:bike_id/years_bikes/:id/:year' => 'years_bikes#destroy', as: 'years_bike_destroy'
  end

    get 'search' => 'bikes#search_bike', as: 'search_bike'
    get 'bikes/new'
    post 'bikes/create'

    resources :impressions, only: [:destroy]

  end

end
