# app/controllers/api/v1/base.rb
module API
  module V1
    class Base < Grape::API
      	mount API::V1::Games
    end
  end
end
