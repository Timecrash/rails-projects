Rails.application.routes.draw do
  #root                 'posts#index'
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

end
