class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
    	t.string   "leaderboard_name"
    	    t.string   "icon"
    	    t.text     "desc"
    	    t.integer  "list_order"
    	    t.boolean  "limit"
    	    t.string   "score_formatting"
    	    t.string   "type"
    	    t.string   "time_frame"
    	    t.string   "ordering"
    	    t.integer  "game_id"
    	    t.datetime "created_at",       null: false
    	    t.datetime "updated_at",       null: false
      t.timestamps null: false
    end
  end
end
