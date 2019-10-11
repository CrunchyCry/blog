Rails.application.routes.draw do
  post 'application/change_theme'
  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)' do 
    root 'welcome#index', via: :all
  end

  get 'users/index' 
    

end

