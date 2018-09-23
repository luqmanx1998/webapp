class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :from_user, index: true
      t.datetime :read_at
      t.string :action
      t.references :notifiable, polymorphic: true

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :from_user_id
  end
end
