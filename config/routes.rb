Rails.application.routes.draw do
  resources :events
  devise_for :users
  get 'calendar/show'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
