devise_for :teachers, skip: [:registrations, :confirmations]

namespace :portal, path: 'portal' do
  root 'dashboard#index'
  resources :dashboard
  resources :locations
end