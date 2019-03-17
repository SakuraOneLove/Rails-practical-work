Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'grad/newsx'
  get 'grad/input'
  get 'grad/main'
  get 'grad/output'
  delete 'grad/deletear'

  get 'session/login'

  post 'session/create'
  post 'grad/addnewar'

  get 'session/logout'

  resources :users, :except => [:index]
  root to: 'grad#newsx'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
