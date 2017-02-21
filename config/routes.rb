Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index]
  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/edit'

  # resources :posts

  # resources :topics

  # resources :topics do
  #   resources :posts, except: [:index] do
  #     resources :comments, only: [:create, :destroy]
  #   end
  # end

  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
  end

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up_vote' => 'votes#up_vote', as: :up_vote
    post '/down_vote' => 'votes#down_vote', as: :down_vote
  end
  
  # get 'welcome/contact'

  # get 'welcome/index'

  # get 'welcome/about'

  get 'about' => 'welcome#about'


  # get 'contact' => 'welcome#contact'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
