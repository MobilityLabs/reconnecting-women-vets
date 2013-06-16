Reconnecting::Application.routes.draw do

  match "/", to: 'static_pages#home', via: 'get'
  match "demonstration", to: 'static_pages#demonstration', via: 'get'
  match "contact-us", to: 'static_pages#contact_us', via: 'get'
  match "strategy", to: 'static_pages#strategy', via: 'get'


  resources :actions


  resources :categories


  resources :resources


  resources :questions


  resources :pathways


end
