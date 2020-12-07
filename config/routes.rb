Rails.application.routes.draw do

  root to: 'pages#home'

  #Login/logout routes for

  get '/login' => 'session#new'        # show login form
  post '/login' => 'session#create'    # form submits here, perform login, redirects
  delete '/login' => 'session#destroy' # logout link goes here, perform logout, redirect

# create all 7 CRUD routes for our User Model
resources :users

# create all & CRUD routes for TrainingPlan Model
resources :training_plans

end # Routes
