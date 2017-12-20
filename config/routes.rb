Rails.application.routes.draw do
  get 'users/show'

  get 'users/edit'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'advertisements/favorited'

  get 'advertisements/unfavorite'

  get 'advertisements', to:'advertisements#index'

  get 'advertisements/new'

  get 'advertisements/create'

  get 'advertisements/show'

  get 'advertisements/edit'

  get 'advertisements/update'

  get 'advertisements/destroy'

  get 'advertisements/advertisment_coordinates'

  get 'advertisements/coordinates'

  get 'advertisements/advertisement_params'

  get 'advertisements/set_advertisement'

  devise_for :users
  root to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
