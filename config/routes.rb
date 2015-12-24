Rails.application.routes.draw do

  devise_for :users

  resources :bookmarks, except: [:index]

  resources :topics

  resources :users, only: [:index, :show]

  post :incoming, to: 'incoming#create'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
