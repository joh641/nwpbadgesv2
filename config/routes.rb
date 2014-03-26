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
      get 'claim'
      get 'push'
      put 'approve'
      put 'claim_create'
      put 'reject'
    end
  end

  root :to => "badges#index"

end
