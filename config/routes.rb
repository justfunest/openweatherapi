Rails.application.routes.draw do
  get '/' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.yaml')

  namespace :api do
    resources :weather_conditions, :only => [:index, :create, :show]
    resources :weather_condition_groups, :only => [:index, :create, :show]
    resources :cities, :only => [:index, :create, :show]
    resources :city_weathers, :only => [:index, :create, :show]
    resources :city_weather_conditions, :only => [:index, :create, :show]
    resources :users, :only => [:index, :create, :show]
    get 'forecast', to: 'forecast#index'
    get 'import_city', to: 'open_weather_map_api#import_city'
  end

end
