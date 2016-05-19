class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string   "game_name"
    	    t.string   "category"
    	    t.string   "playstore_url"
    	    t.datetime "created_at",    null: false
    	    t.datetime "updated_at",    null: false
      t.timestamps null: false
    end
  end
end
