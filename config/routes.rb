Nwpbadges::Application.routes.draw do

  devise_for :users

  resources :badges do
    member do
      get 'assert'
      get 'submit'
      post 'claim'
    end
  end

  resources :submissions do
    member do
      get 'assert'
      get 'push'
      put 'approve'
      put 'reject'
    end
    collection do
      get 'my'
    end
  end

  root :to => "badges#index"

end
