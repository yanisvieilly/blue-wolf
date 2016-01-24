Rails.application.routes.draw do
  resources :questions, only: %i(new create)

  root 'questions#index'
end
