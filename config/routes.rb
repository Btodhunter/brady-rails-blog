Rails.application.routes.draw do
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end
  resources :tags

end
