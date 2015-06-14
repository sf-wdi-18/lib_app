Rails.application.routes.draw do

  root "users#index"

  get "/login", to:"sessions#new", as: "login"
  get "/logout", to:"sessions#destroy", as: "logout"
  post "/sessions", to: "sessions#create"

  get "/users", to: "users#index"
  post "/users", to: "users#create"
  get "/users/new", to: "users#new", as: "new_user"
  get "/users/:id", to: "users#show", as: "user"
  put "/users/:id", to: "users#update"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"

  get "/libraries", to: "libraries#index"
  post "/libraries", to: "libraries#create"
  get "/libraries/new", to: "libraries#new", as: "new_library"
  get "/libraries/:id", to: "libraries#show", as: "library"
  put "/libraries/:id", to: "libraries#update"
  get "/libraries/:id/edit", to: "libraries#edit", as: "edit_library"

  get "/users/:user_id/libraries", to: "libraries_users#index", as: "user_libraries"
  post "/libraries/:library_id/users", to: "libraries_users#create", as: "library_users"
  delete "/libraries/:library_id/users", to: "libraries_users#destroy"

end
