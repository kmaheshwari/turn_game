require 'rails_helper'

RSpec.describe User, type: :model do
  demo_user=User.create!(uid:"123456789",name:"John",age: 22,access_token: "4782011092",image:"default")
end
