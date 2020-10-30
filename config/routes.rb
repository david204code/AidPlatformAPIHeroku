Rails.application.routes.draw do
  
  patch 'users/:id', to: 'users#update'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  get 'latest/user', to: 'users#getLast'
  
  resources :helps, params: :id
  get '/helpChat/:id', to: 'helps#helpChat'
  get '/publish', to: 'helps#publish'
  get '/activeHelps/:id', to: 'helps#activeHelp'
  get '/counter', to: 'helps#counter'
  get '/checkUser/:helpId/:id', to: 'helps#checkUser'
  patch '/updateStatus/:id', to: 'helps#updateStatus'
  patch '/completeHelp/:id', to: 'helps#completeHelp'
  patch '/archiveHelp/:id', to: 'helps#archiveHelp'
  
  resources :accepted_helps
  get 'accepted_help/:id', to: 'accepted_helps#show'
  get 'latest/accepted_help', to: 'accepted_helps#getLast'
  get '/activeAcceptedHelps/:id', to: 'accepted_helps#activeAcceptedHelps'
  get '/acceptedHelpCounter/:id', to: 'accepted_helps#acceptedHelpCounter'
  patch '/updateActive/:id', to: 'accepted_helps#updateActive'
  
  resources :messages
  resources :conversations
  get '/conversation/:id', to: 'conversations#findAccepted'

  mount ActionCable.server => '/cable'
  
end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html