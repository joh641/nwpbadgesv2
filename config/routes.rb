Nwpbadges::Application.routes.draw do

  devise_for :users

  resources :badges

  resources :submissions

  root :to => "badges#index"

end
