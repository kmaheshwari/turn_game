class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string   "uid"
	    t.string   "name"
	    t.integer  "age"
	    t.string   "access_token"
	    t.string   "image"
	    t.datetime "created_at",   null: false
	    t.datetime "updated_at",   null: false
      t.timestamps null: false
    end
  end
end
