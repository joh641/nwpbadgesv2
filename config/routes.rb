Nwpbadges::Application.routes.draw do

  devise_for :users
  resources :users do
    member do
      put 'make_admin'
      put 'remove_admin'
    end
  end

  resources :badges do
    member do
      get 'assert'
      get 'submit'
      post 'claim'
      post 'create_claimcode'
    end
    collection do
      get 'organization'
    end
  end

  resources :claimcodes do
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
