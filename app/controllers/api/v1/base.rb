# app/controllers/api/v1/base.rb
module API
  module V1
    class Base < Grape::API
      	mount API::V1::Games
      	mount API::V1::Categories
      	mount API::V1::Leaderboards
      	mount API::V1::PlaystoreUrls
      	mount API::V1::Users
    end
  end
end
