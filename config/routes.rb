Rails.application.routes.draw do

  get 'search/index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  authenticated :user do
    root 'user#index' ,                     as: :authenticated_root
  end
  
  root 'home#index'


  namespace :api , defaults: {format: 'json'} do
    get 'notifications',                     to: 'notifications#index'
    get 'following',                          to: 'user#index'
   end

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
    invitations: 'devise/users/invitations',
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

  get 'chosen-one/accept',                to: 'devise/users/invitations#edit',      as: :accept_user_invitation
  get 'chosen-one/decline',               to: 'devise/users/invitations#destroy',   as: :remove_user_invitation
  get 'invite',                           to: 'devise/users/invitations#new',       as: :new_user_invitation
  patch 'users/invitation',               to: 'devise/users/invitations#update',    as: :user_invitation
  put 'users/invitation',                 to: 'devise/users/invitations#update'
  post 'invite',                          to: 'devise/users/invitations#create'
  end

  get 'user/:username' => 'user#show',      :constrain => { :username => /[a-zA-Z-]+/ }, as: :profile
  get 'followings',                          to: 'user#index'

  resources :user, :only => [:show] do
    member do
      get :follow
      get :unfollow
    end
  end

  get 'discover',                           to: 'post#index',            as: :discover
  get 'create',                             to: 'post#new',              as: :new_post
  get 'post/:url/edit',                     to: 'post#edit',             as: :edit_post
  get 'post/:url',                          to: 'post#show',             as: :post
  delete 'post/:url',                       to: 'post#destroy'

  post 'texts',                             to: 'post/texts#create',      as: :post_texts
  get 'new/text',                           to: 'post/texts#new',         as: :new_text
  patch 'post/:url',                         to: 'post#update' ,          as: :post_text


  post 'images',                            to: 'post/images#create',     as: :post_images
  get 'new/image',                          to: 'post/images#new',        as: :new_image
  patch 'post/:url',                         to: 'post#update' ,          as: :post_image

  post 'audios',                            to: 'post/audios#create',     as: :post_audios
  get 'new/audio',                          to: 'post/audios#new',        as: :new_audio
  patch 'post/:url',                         to: 'post#update' ,          as: :post_audio

  post 'post/:url/comments',                 to: 'comments#create',   as: :post_comments
  delete 'post/:url/comment/:comment_id',    to: 'comments#destroy',  as: :post_comment

  get "hashtags/:hashtag",                  to: "hashtags#show",          as: :hashtag

  get 'search',                             to: "search#index",           as: :search



  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

end
