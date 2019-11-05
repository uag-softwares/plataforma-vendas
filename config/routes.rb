Rails.application.routes.draw do
  resources :items
  resources :pedidos do
    put 'efetuar'
    put 'cancelar'
    put 'aceitar'
    put 'finalizar'
  end
  devise_for :usuarios, controllers: {
      registrations: 'usuarios'
  }
  resources :produtos do
    resources :comentarios, except: [:index, :show]
  end
  resources :comentarios do
    resources :comentarios, except: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
