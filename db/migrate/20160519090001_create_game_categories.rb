class CreateGameCategories < ActiveRecord::Migration
  def change
    create_table :game_categories do |t|
      t.integer :category_id
      t.integer :game_id

      t.timestamps null: false
    end
    remove_column :games, :category, :string
    remove_column :games, :playstore_url, :string
    add_column :games, :category_id, :integer
    add_column :games, :playstore_url_id, :integer
  end
end
