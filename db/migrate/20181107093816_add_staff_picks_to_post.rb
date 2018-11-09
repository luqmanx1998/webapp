class AddStaffPicksToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :staff_pick, :boolean
  end
end
