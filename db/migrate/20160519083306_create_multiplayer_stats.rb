class CreateMultiplayerStats < ActiveRecord::Migration
  def change
    create_table :multiplayer_stats do |t|
    	t.string   "user1_id"
	    t.string   "user2_id"
	    t.integer  "game_id"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
      t.timestamps null: false
    end
  end
end
