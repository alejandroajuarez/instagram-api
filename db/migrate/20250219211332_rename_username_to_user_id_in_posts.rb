class RenameUsernameToUserIdInPosts < ActiveRecord::Migration[7.2]
  def change
    rename_column :posts, :username, :user_id
  end
end
