namespace :clients, path: 'clients' do
  root 'carts#index'
  resources :carts
end