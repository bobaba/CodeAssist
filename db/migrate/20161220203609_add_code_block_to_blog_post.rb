class AddCodeBlockToBlogPost < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :codeblock, :text
  end
end
