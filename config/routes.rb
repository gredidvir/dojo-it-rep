Rails.application.routes.draw do
  get 'welcome/contact'

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
