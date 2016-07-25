Rails.application.routes.draw do

  ## Root, Main ##
  root 'projects#index'

  ## Users ##
  #resources :users
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  ## Projects ##
  # Instead of the following lines, could use:
  resources :projects do
    resources :tasks
    resources :features
  end
  #get '/projects' => 'projects#index' #Show list of projects
  #get '/projects/:id' => 'projects#show', as: :project #Show individual project
  #get '/projects/:id/edit' => 'projects#edit', as: :edit_project
  #patch '/projects/:id' => 'projects#update'
  #get '/new_project' => 'projects#new'
  #post 'projects' => 'projects#create'
  ##delete 'projects' => 'projects#destroy'

  ## Tasks ##
  resources :tasks

  ## Features ##
  resources :features
  
  ## Other Stuff ##


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
