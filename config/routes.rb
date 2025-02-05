Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resources :users, only: %i(new create show)
    resources :soccer_fields, only: %i(index show)
    namespace :admin do
      get "static_pages/home"
      get "static_pages/help"
    end
  end
end
