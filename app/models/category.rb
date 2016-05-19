class Category < ActiveRecord::Base
	has_many :games, through: :game_category
end
