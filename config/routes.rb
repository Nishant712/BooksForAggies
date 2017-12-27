Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'

  get 'book/index'

  get '/users/signin', to: 'users#signin'

  get '/users/signup', to: 'users#create'
  get '/logout', to: 'home#logout'
  get '/find/logout', to: 'find#logout'

  get '/home/book', to: 'home#book'

  get '/find/users', to: 'find#signin'

  get '/book/users', to: 'book#signin'

  get '/book/logout', to: 'book#signout'

  post '/book/create', to: 'book#create'

  get '/book/delete/:id', to: 'book#delete'

  get '/book/edit/:id', to: 'book#edit'

  post 'book/update/:id', to: 'book#update'

  get 'show/:id/show', to: 'show#index'

  get '/show/books', to: 'show#books'

  get '/show/notifications', to: 'show#notifications'
  post '/show/requesting', to: 'show#requesting'
  root 'home#index'
  
  get '/about', to: 'show#about'
  get '/contact', to: 'show#contact'

  post '/users/forget', to: 'users#forget'
  resources :book
  

  resources :users, except: [:new]
  resources :find

  #resources :show
  
end
