Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "staticpages#top"
  resources :users
  resources :bookmarks, only: %i[create destroy]
  resources :diaries, shallow: true do
    resources :comments, shallow: true
    collection do
      get 'bookmarks'
    end
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout

end
