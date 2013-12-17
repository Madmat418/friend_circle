FriendCircle::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :forgotten_passwords, :only => [:new, :create]
  get '/forgotten_passwords/:reset_token' => 'forgotten_passwords#edit'
  put '/forgotten_passwords/:reset_token' => 'forgotten_passwords#update', :as => :reset_password
  resources :buddy_circles
  resources :buddy_circle_memberships, :only => [:destroy]

end
