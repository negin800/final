Rails.application.routes.draw do

  # root 'petbnb#index' 
  
  get "/" => 'petbnb#index'
  get "petbnb/show" => "petbnb#show"
  get "/login" => "sessions#new"
  get "/sessions/create" => 'sessions#create'
  get "/logout" => "sessions#destroy"
  
  get "/postings" => "postings#index"
  get "/postings/new" => "postings#new"
  get "/postings/create" => "postings#create"
  get "/postings/:id/delete" => "postings#destroy"
  get "/postings/:id" => "postings#show"
  get "/postings/:id/edit" => "postings#edit"
  get "/postings/:id/update" => "postings#update"
  
  get "/myaccount" => "users#show"
  get "/bookings/:id" => "bookings#show"
  get "/bookings/:id/create" => "bookings#create"
  
  get "/users" => "users#index"
  get "/users/new" => "users#new"
  get "/users/create" => "users#create"
  get "/users/:id/delete" => "users#destroy"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  get "/users/:id/update" => "users#update"
  

  
end