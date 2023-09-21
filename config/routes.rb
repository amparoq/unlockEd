Rails.application.routes.draw do
  resources :tasks do
    resources :alternative_questions
    resources :numerical_questions
  end

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  
  resources :numerical_questions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post "/update_error_counter", to: 'alternative_questions#update_error_counter'
  post "/update_error_counter_numerical", to: 'numerical_questions#update_error_counter'
  post '/update_last_answer', to: 'numeric_questions#update_last_answer'
  post "/update_attempt", to: 'alternative_questions#update_attempt'



end
