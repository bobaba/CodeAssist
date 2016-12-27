class AddCodeTypeToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :codetype, :string
  end
end
