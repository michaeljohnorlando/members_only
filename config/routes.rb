#########################################################
# Routeing in rails is confuseing ...                   #
# see http://guides.rubyonrails.org/v3.2.9/routing.html #
#########################################################
Rails.application.routes.draw do
  # created posts with
  # rails generate scaffold Post name:string title:string content:text
  #http://guides.rubyonrails.org/v3.2.9/getting_started.html
  resources :posts
  ########################################
  # resources :users                     #
  # that would create all RESTFUL routes #
  ########################################
  get  "/users/new"    => "users#new"
  post "/users"        => "users#create"
  get  "/users/log_in" => "users#log_in"
  post "/users/log_in" => "users#log_in_check"
  get  "/pages/home" => "view#home"
end
