class CreateMultiplayerScores < ActiveRecord::Migration
  def change
    create_table :multiplayer_scores do |t|
    	t.integer  "stat_id"
    	    t.string   "user1_score"
    	    t.string   "user2_score"
    	    t.datetime "created_at",  null: false
    	    t.datetime "updated_at",  null: false
      t.timestamps null: false
    end
  end
end
