Rails.application.routes.draw do
  resources :pedidos, except: [:create, :new] do
    resources :items, except: [:index, :new]
    member do
      put 'efetuar'
      put 'cancelar'
      put 'aceitar'
      put 'finalizar'
    end
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
