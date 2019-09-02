Rails.application.routes.draw do
  get 'populations', to: 'populations#index'
  # get 'populations/by_year', to: 'populations#show' # this route has been deprecated
  get 'populations/the_logz', to: 'status_logs#index', as: 'logz'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
