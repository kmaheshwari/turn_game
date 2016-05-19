class Game < ActiveRecord::Base
	has_many :categories, through: :game_category
	has_many :playstore_url
end
