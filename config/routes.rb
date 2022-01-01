Rails.application.routes.draw do
  # Added due to failing test requiring hosts to exist change to production URL.
  default_url_options :host => "lofft.app"
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show]
    resources :apartments, only: %w[index create]
    resources :bills, only: %w[index create update]
    resources :user_bills, only: %w[index]
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/signin',
      sign_out: 'api/signout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
