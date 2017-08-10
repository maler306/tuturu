Rails.application.routes.draw do
  resources :trains do
    resources :carriages
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrival_time, on: :member
    patch :update_departure_time, on: :member
    # patch :update_station_attr, on: :member
  end

  resources :routes

  resource :search, only: [:new, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
