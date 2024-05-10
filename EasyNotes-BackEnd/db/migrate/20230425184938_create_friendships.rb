class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.string :name_user1
      t.string :name_user2
      t.integer :id_user1
      t.integer :id_user2
      t.integer :allowed

      t.timestamps
    end
  end
end
