Reconnecting::Application.routes.draw do

  match "/", to: 'static_pages#home', via: 'get'
  match "demonstration", to: 'static_pages#demonstration', via: 'get'


  resources :actions


  resources :categories


  resources :resources


  resources :questions


  resources :pathways


end
