class Game < ActiveRecord::Base
	has_many :categories, through: :game_categories
	has_many :game_categories ,dependent: :destroy
	has_many :playstore_url
end
