scope module: :api do
  namespace :v1 do
    resources :auth, only: [:create]
  end
end