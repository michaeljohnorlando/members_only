#########################################################
# Routeing in rails is confuseing ...                   #
# see http://guides.rubyonrails.org/v3.2.9/routing.html #
#########################################################
Rails.application.routes.draw do
  get  "/users/new"    => "users#new"
  post "/users"        => "users#create"
  get  "/users/log_in" => "users#log_in"
  ########################################
  # resources :users                     #
  # that would create all RESTFUL routes #
  ########################################
end
