Rails.application.routes.draw do

  mount API::Base => '/api'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
end
