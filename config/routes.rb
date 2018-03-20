Rails.application.routes.draw do
  namespace :api do
    resources :cities, :only => [:index, :create, :show]
  end

end
