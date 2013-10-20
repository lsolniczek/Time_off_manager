TimeOffManager::Application.routes.draw do

root 'employees#index'

resources :employees do
  resources :time_offs
end

end