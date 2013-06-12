Reconnecting::Application.routes.draw do
  match "/", to: 'static_pages#home', via: 'get'
  match "demonstration", to: 'static_pages#demonstration', via: 'get'
  match "contact-us", to: 'static_pages#contact_us', via: 'get'

  resources :categories


  resources :resources


  resources :questions


  resources :pathways


end
