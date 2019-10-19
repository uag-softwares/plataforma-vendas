Rails.application.routes.draw do
  devise_for :usuarios
  resources :usuarios
  resources :produtos do
    resources :comentarios
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
