class RemovePlaystroerUrlForeign < ActiveRecord::Migration
  def change
    remove_foreign_key :games ,:playstore_urls

    remove_column :games ,:playstore_url_id ,:integer

    add_column :playstore_urls ,:game_id ,:integer

    add_foreign_key :playstore_urls ,:games 
  end
end
