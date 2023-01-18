Rails.application.routes.draw do
  resources :lists, only: [:create, :index, :show, :new, :destroy]  do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
