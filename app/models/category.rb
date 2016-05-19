class Category < ActiveRecord::Base
	has_many :games, through: :game_category
	has_many :game_category, dependent: :destroy
end
