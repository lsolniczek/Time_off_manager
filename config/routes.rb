TimeOffManager::Application.routes.draw do

root 'authentication#new'

resources :employees do
  resources :time_offs do
  	get :change
  	get :accept
  	get :reject
  	get :cancel
  end
end

resources :authentication, only: [:new, :create, :destroy]

post 'login' => "authentication#create"
get 'logout' => "authentication#destroy"
get '/toaccept/:employee_id' => "time_offs#toaccept", :as => "toaccept"

end