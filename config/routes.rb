Reconnecting::Application.routes.draw do

  devise_for :admins
  match "/", to: 'static_pages#home', via: :get
  match "demonstration", to: 'static_pages#demonstration', via: :get
  match "contact-us", to: 'static_pages#contact_us', via: :get
  match "strategy", to: 'static_pages#strategy', via: :get
  match "how-it-works", to: 'static_pages#how', via: :get


  resources :admins, only: [:index, :show, :destroy]
  match 'admins/confirm', to: 'admins#confirm', via: [:put, :patch]


  resources :categories


  resources :resources


  resources :pathways
  match "pathways/:id/questions", to: 'pathways#questions',
        as: :pathway_questions_order, via: :get
  # resources :pathways do
  #   resources :questions do
  #     resources :answers
  #   end
  # end


  resources :questions
  namespace :ux do
    resources :questions, only: :show
  end

  resources :answers

  # added per devise instructions
  root to: 'static_pages#home'

end
