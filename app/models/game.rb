class Game < ActiveRecord::Base
	has_many :categories, through: :game_category
	has_many :playstore_url
	has_many :game_category, dependent: :destroy
end
