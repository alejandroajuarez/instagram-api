class ChangeUserIdTypeInPosts < ActiveRecord::Migration[7.2]
  def change
    change_column :posts, :user_id, :integer, using: 'user_id::integer'
  end
end
