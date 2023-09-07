Rails.application.routes.draw do
  resources :tasks do
    resources :alternative_questions
    resources :numerical_questions
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
