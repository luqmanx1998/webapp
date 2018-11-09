class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|

      t.timestamps
    end
  end
end
