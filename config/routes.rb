Rails.application.routes.draw do
    # devise_for :users
    resources:articles, only: [:show,:index,:new,:create,:edit,:update,:destroy]
    resources:users, except: [:new]
    root "articles#home"
    get "signup" => "users#new"
    get "login" => "sessions#new"
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"
end
