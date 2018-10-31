class AddPrivateToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :private, :boolean, null: false, default: false
  end
end
