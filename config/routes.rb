Rails.application.routes.draw do
devise_for :admins
  mount API::Base => '/api'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
