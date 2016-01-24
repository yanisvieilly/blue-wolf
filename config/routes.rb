Rails.application.routes.draw do
  resources :questions, only: %i(index create)

  root 'questions#index'
end
