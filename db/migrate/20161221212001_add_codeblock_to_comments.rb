class AddCodeblockToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :codeblock, :text
  end
end
