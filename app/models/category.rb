class Category < ActiveRecord::Base
	has_many :games, through: :game_categories
	has_many :game_categories ,dependent: :destroy
end
