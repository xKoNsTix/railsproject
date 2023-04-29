Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations',}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: "home#index"
  # root "articles#index"
  #asd
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  get "/users/edit", to: "users#edit", as: "edit_user"
  get "/rooms", to: "rooms#index"
  get"/active_rooms", to: "rooms#active"
  get"/open_rooms", to: "rooms#open"
  get"/rounds/:id", to: "rounds#index", as: 'rounds'
  get"/rounds/x/:id", to: "rounds#x", as: 'rounds_x'
  get"/rounds/o/:id", to: "rounds#o", as: 'rounds_o'
  get "/rounds/false/:id", to: "rounds#false", as: 'rounds_false'
  get "/rounds/correct/:id", to: "rounds#correct", as: 'rounds_correct'
  get "/rounds/win/:id", to: "rounds#win", as: 'rounds_win'
  get "/open_rooms/create", to: "rooms#create", as: 'create_rooms'
  get "/open_rooms/join/:id", to: "rooms#join", as: 'join_rooms'
  resources :users, only: [:edit, :update]
end



