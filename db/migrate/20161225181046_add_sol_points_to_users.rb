class AddSolPointsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :solPoints, :integer
  end
end
