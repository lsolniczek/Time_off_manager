TimeOffManager::Application.routes.draw do

root 'authentication#new'

resources :employees do
  resources :time_offs do
  	get :change
  end
end

resources :authentication, only: [:new, :create, :destroy]

post 'login' => "authentication#create"
get 'logout' => "authentication#destroy"

end