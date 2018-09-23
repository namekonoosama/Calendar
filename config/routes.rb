Rails.application.routes.draw do
  get '/calendar' => "calendar#test"
  get '/calendar/:year/:month/:day/back' => "calendar#back"
  get '/calendar/:year/:month/:day/go' => "calendar#go"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
