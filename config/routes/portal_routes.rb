devise_for :teachers, skip: [:registrations, :confirmations]

root 'portal/users#index'

namespace :portal, path: 'portal' do
  root 'users#index'
  resources :users
end