scope module: :api do
  namespace :v1 do
    resources :auth, only: [:create]
    resources :tests, only: [:index, :show] do
      member do
        post :commit
      end
    end
  end
end