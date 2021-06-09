Rails.application.routes.draw do
  root 'books#index'
  resources :books, only: %i[index new create show]
end
