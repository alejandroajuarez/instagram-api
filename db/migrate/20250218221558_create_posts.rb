class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :username
      t.text :image_url
      t.text :caption

      t.timestamps
    end
  end
end
