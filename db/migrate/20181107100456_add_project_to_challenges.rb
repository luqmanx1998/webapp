class AddProjectToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_reference :challenges, :project, foreign_key: true
  end
end
