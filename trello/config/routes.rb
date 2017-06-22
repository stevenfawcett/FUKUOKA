Rails.application.routes.draw do
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/show'   , to: 'trello_cards#show'

  root 'trello_cards#index' 
  resources :trello_cards , only: [:new, :create, :index]
end
