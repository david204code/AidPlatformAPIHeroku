Rails.application.routes.draw do
  
  resources :messages
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  
  resources :helps, params: :id
  get '/helpChat/:id', to: 'helps#helpChat'
  get '/publish', to: 'helps#publish'
  get '/activeHelps', to: 'helps#activeHelp'
  get '/counter', to: 'helps#counter'
  get '/checkUser/:helpId/:id', to: 'helps#checkUser'
  patch '/updateStatus/:id', to: 'helps#updateStatus'
  patch '/completeHelp/:id', to: 'helps#completeHelp'
  patch '/archiveHelp/:id', to: 'helps#archiveHelp'
  
  resources :accepted_helps
  get 'latest/accepted_help', to: 'accepted_helps#getLast'
  get '/activeAcceptedHelps', to: 'accepted_helps#activeAcceptedHelps'
  patch '/updateActive/:id', to: 'accepted_helps#updateActive'
  
  resources :conversations
  
end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html