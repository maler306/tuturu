Rails.application.routes.draw do
  resources :trains do
    resources :carriages
  end
  resources :railway_stations
  resources :routes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
