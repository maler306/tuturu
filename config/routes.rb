Rails.application.routes.draw do
  get 'tickets/new'

  get 'tickets/create'

  get 'tickets/show'

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

  resource :search, only: [:new, :show, :create]
  resources :tickets,  except: [:edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
