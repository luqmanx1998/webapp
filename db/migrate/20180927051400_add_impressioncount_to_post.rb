class AddImpressioncountToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :views, :int,  null: false, default: 0
  end
end
