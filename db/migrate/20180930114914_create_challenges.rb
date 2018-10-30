class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.string :cover
      t.string :video
      t.references :user, foreign_key: true
      t.integer :challenge_type_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :challenges, :challenge_type_id
    add_index :interests, :name,                unique: true
  end
end
