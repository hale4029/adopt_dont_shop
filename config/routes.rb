Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/', to: 'welcome#index'

get '/shelters', to: 'shelters#index'
get '/shelters/new', to: 'shelters#new'
post '/tasks', to: 'tasks#create'
get '/shelters/:id', to: 'shelters#show'


end
