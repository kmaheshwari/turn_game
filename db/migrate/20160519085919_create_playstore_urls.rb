class CreatePlaystoreUrls < ActiveRecord::Migration
  def change
    create_table :playstore_urls do |t|
      t.string :url
      t.timestamps null: false
    end
  end
end
