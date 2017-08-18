Rails.application.routes.draw do
  devise_for :users

  # get 'tickets/new'
  # get 'tickets/create'
  # get 'tickets/show'
  namespace :admin do

    resources :trains do
      resources :carriages
    end

    resources :railway_stations do
      # patch :update_position, on: :member
      # patch :update_arrival_time, on: :member
      # patch :update_departure_time, on: :member
      patch :update_station_attr, on: :member
    end

    resources :routes

  end

  resource :search, only: [:new, :show, :create]
  resources :tickets,  except: [:edit, :update]

  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
