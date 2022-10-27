Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  resources :users do
    resource :follows
    get 'followings' => 'follows#followings'
    get 'followers' => 'follows#followers'
  end
end
