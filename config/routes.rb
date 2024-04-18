Rails.application.routes.draw do
  root "staticpages#top"
  resources :users
  resources :diaries, shallow: true do
    resources :comments, shallow: true
    collection do
      get 'bookmarks'
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]

  get 'mydiaries', to: 'diaries#my_diaries'

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
