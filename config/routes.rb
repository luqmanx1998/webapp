Rails.application.routes.draw do
  root 'home#index'

  namespace :wtf do
    get '/', to: '/wtf#index'
    get 'about', to: 'about#index'
    get 'support', to: 'support#index'
    get 'features', to: 'features#index'
    get 'policies/rules'
    get 'policies/terms'
    get 'policies/privacy'
  end

  post 'join',                              to: 'requests#create'
  get 'join',                               to: 'requests#new',                         as: :new_requests
  get 'requested',                          to: 'requests#requested',                   as: :requested
end
