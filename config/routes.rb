Rails.application.routes.draw do
  resources :questions, only: %i(index new create)
  resources :answers, only: %i(index create)

  root 'questions#index'
end
