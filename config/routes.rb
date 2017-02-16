Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/test' => 'welcome#index'
  post '/test' => 'welcome#show'

  root 'welcome#index'

end
