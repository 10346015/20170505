Rails.application.routes.draw do
  resources :accounts do
    resources :lists
  end
end
