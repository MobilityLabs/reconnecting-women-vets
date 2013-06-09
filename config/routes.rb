Reconnecting::Application.routes.draw do
  match "home", to: 'static_pages#home', via: 'get'
  match "final", to: 'static_pages#final', via: 'get'

  resources :categories


  resources :resources


  resources :questions
  match "question", to: 'static_pages#question', via: 'get'


  resources :pathways


end
