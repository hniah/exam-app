scope module: :api do
  namespace :v1 do
    resources :shopify, only: [] do
      collection do
        post :delivery_times
        post :testing
      end
    end

    resources :no_while_list, only: [] do
      collection do
        post :delivery_times
      end
    end
  end
end