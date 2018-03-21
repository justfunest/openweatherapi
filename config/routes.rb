Rails.application.routes.draw do

  get '/docs' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.yaml')

  namespace :api do
    resources :weather_conditions, :only => [:index, :create, :show]
    resources :weather_condition_groups, :only => [:index, :create, :show]
    resources :cities, :only => [:index, :create, :show]
    resources :city_weathers, :only => [:index, :create, :show]
    resources :city_weather_conditions, :only => [:index, :create, :show]
    get 'forecast', to: 'forecast#index'
  end

end
