Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  resources :users

  resources :padraos

  get "welcome/index"

  resources :solexames do
    member do
      # /agreements/:id/export
      get 'export'
    end
  end

  resources :clilabs
  resources :exames
  resources :medicamentos do
    get :autocomplete_medicamento_descricao, :on => :collection
  end
  resources :viaaplics
  resources :pacientes, :has_many => :receitas
  resources :receitas do
    member do
     # /agreements/:id/export
     get 'export'
   end
  end

  resources :impreceita
  resources :impsolexame

  root 'welcome#index'

end
