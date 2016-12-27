class AddCodeTypeToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :codetype, :string
  end
end
