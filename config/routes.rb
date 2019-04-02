Rails.application.routes.draw do
  resources :links do
     collection do
      get :stats
    end
  end
  get '/:token' => 'links#short_url', as: :short_link
  get '/404', to: 'errors#not_found'
  root 'links#home'
end
