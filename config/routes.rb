Rails.application.routes.draw do
  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/edit'

  resources :posts

  get 'welcome/contact'

  # get 'welcome/index'

  # get 'welcome/about'

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
