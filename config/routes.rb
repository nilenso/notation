# frozen_string_literal: true

Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users do
    devise_for :notes
  end
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get "/users" => "devise/registrations#index"
    get "/notes" => "notes#index"
    post "/notes" => "notes#create"
    patch "/notes" => "notes#update"
    delete "/notes" => "notes#destroy", :as => "destroy_notes"
    get "/notes/new" => "notes#new"
    get "/notes/search" => "notes#search", :as => "search_notes"
    get "/notes/:id/edit" => "notes#edit", :as => "edit_notes"
  end

  root "welcome#index"
end
