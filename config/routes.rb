Rails.application.routes.draw do

  root 'home#index'
  
  get 'home/index'
  post '/write' => 'home#write'
  
  get '/mailbox' => 'home#mailbox'
  
  get '/detail/:p_id' => 'home#detail'
  
  get '/destroy/:p_id' => 'home#destroy'
end
