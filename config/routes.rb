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

  devise_for :users, skip: :all, controllers: {
    sessions: 'devise/users/sessions',
    passwords: 'devise/users/passwords',
    registrations: 'devise/users/registrations',
    confirmations: 'devise/users/confirmations',
  }

  devise_scope :user do
  get 'login',                            to: 'devise/users/sessions#new',          as: :new_user_session
  post 'login',                           to: 'devise/users/sessions#create',       as: :user_session
  get 'logout',                           to: 'devise/users/sessions#destroy',      as: :destroy_user_session

  get 'secret/new',                       to: 'devise/users/passwords#new',         as: :new_user_password
  get 'secret/edit',                      to: 'devise/users/passwords#edit',        as: :edit_user_password
  patch 'secret',                         to: 'devise/users/passwords#update',      as: :user_password
  put 'secret',                           to: 'devise/users/passwords#update'
  post 'secret',                          to: 'devise/users/passwords#create'

  get 'userinfo',                         to: 'devise/users/registrations#edit',    as: :edit_user_registration
  patch 'userinfo',                       to: 'devise/users/registrations#update',  as: :user_registration
  put 'userinfo',                         to: 'devise/users/registrations#update',  as: :user
  delete 'userinfo',                      to: 'devise/users/registrations#destroy'
  post 'userinfo',                        to: 'devise/users/registrations#create'


  get 'users/confirm',                    to: 'devise/users/confirmations#show',    as: :user_confirmation
  post 'users/confirm',                   to: 'devise/users/confirmations#create'

  end
end
