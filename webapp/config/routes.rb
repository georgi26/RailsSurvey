Rails.application.routes.draw do
  get "survey/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post "survey/vote"

  get "survey/show"

  # Defines the root path route ("/")
  root "survey#index"
end
