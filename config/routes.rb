Rails.application.routes.draw do
  root 'home#index'

  get 'greetings', to: 'greetings#index'

  resources 'posts', only: [:index, :show]
end
