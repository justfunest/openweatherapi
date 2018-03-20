Rails.application.routes.draw do
  namespace :api do
    resources :weather_conditions, :only => [:index, :create, :show]
    resources :weather_condition_groups, :only => [:index, :create, :show]
    resources :cities, :only => [:index, :create, :show]
    resources :city_weathers, :only => [:index, :create, :show]
    resources :city_weather_conditions, :only => [:index, :create, :show]
  end

end
