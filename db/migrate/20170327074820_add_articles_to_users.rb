class AddArticlesToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :author_name, :string
    add_column :articles, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
