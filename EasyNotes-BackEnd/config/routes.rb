Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "notes#index"
      resources :notes, only:[:index, :show, :create, :update, :destroy, :showByUser, :getLast]
      get "/notes", to: "notes#index"
      get "/notes/:id", to: "notes#show"
      post "/notes", to: "notes#create"
      put "/notes/:id", to: "notes#update"
      delete "/notes/:id", to: "notes#destroy"
      get "/notes/user/:user_id", to: "notes#showByUser"
      get "/notes/getLast/get", to: "notes#getLast"
    end
    namespace :v2 do 
      
      root "users#index"
      resources :users, only:[:index, :show, :create, :update, :destroy, :getByName]
      get "/users", to: "users#index"
      get "/users/:id", to: "users#show"
      post "/users/signup", to: "users#create"
      put "/users/:id", to: "users#update"
      delete "/users/:id", to: "users#destroy"
      get "/users/name/:name", to: "users#getByName"
    end
    namespace :v3 do
      root "collections#index"
      resources :collections, only:[:index, :show, :create, :update, :destroy, :showByUser]
      get "/collections", to: "collections#index"
      get "/collections/:id", to: "collections#show"
      post "/collections", to: "collections#create"
      put "/collections/:id", to: "collections#update"
      delete "/collections/:id", to: "collections#destroy"
      get "/collections/user/:id_user", to: "collections#showByUser"
    end
    namespace :v4 do
      root "collection_notes#index"
      resources :collections, only:[:index, :getByCollectionId, :getByNoteId, :create, :destroy]
      get "/collection_notes", to: "collection_notes#index"
      post "/collection_notes", to: "collection_notes#create"
      get "/collection_notes/collection/:id_collection", to: "collection_notes#getByCollectionId"
      get "/collection_notes/note/:id_note", to: "collection_notes#getByNoteId"  
      delete "/collection_notes/delete/:id_note", to: "collection_notes#destroy"  
    end

    namespace :v5 do
      root "friendships#index"
      resources :friendships, only:[:index, :Allowance, :Denial, :showById,:create, :destroy]
      get "/friendships/:id_user", to: "friendships#index"
      put "/friendships/allow/:id", to: "friendships#Allowance"
      get "/friendships/denial/:id", to: "friendships#Denial" 
      post "/friendships/list", to: "friendships#create" 
      get "/friendships/list/:id_user2", to: "friendships#showById"
      delete "/friendships/:id", to: "friendships#destroy"   
    end
  end
end
