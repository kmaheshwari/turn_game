class AddForeignKey < ActiveRecord::Migration
  def change
  	remove_column :games,:category_id, :integer
  	add_foreign_key :game_categories, :categories
  	add_foreign_key :game_categories, :games
  	add_foreign_key :games, :playstore_urls
  end
end
