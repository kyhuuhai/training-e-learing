Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get'signup' => 'users#new'
  get'login'=>'sessions#new'
  post'login'=>'sessions#create'
  delete'logout'=>'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :courses do 
    member do
      get :words
    end
  end
  resources :user_course
  get 'admin' => 'admin#index'
  namespace :admin do
    resources :users
    resources :courses
    resources :lessons
  end
  get 'learning' => 'lessons#index'
  post 'learning' => 'lessons#create'
  get 'learning/practice' => 'practices#index'
  post 'practice' => 'practices#create'
  get 'lesson/get-word' => 'lessons#get_word'
end
