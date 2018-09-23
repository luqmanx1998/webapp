class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :caption
      t.text :content
      t.string :type
      t.string :url
      t.boolean :content_processing,  null: false, default: false
      t.jsonb :preferences, null: false, default: {}
      t.references :user, foreign_key: true
      
      t.timestamps
    end
    add_index :posts, :type
    add_index :posts, :url, unique: true
  end
end
