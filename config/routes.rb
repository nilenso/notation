# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users do
    devise_for :notes
  end
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get "/users" => "devise/registrations#index"
    get "/notes" => "notes#index"
    post "/notes" => "notes#create"
    get "/notes/new" => "notes#new"
  end

  root "welcome#index"
end
