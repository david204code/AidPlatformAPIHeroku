Rails.application.routes.draw do
  
  resources :users
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'

end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html