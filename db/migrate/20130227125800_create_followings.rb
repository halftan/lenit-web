class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :user
      t.references :followed

      t.timestamps
    end
    add_index :followings, :followed_id
    add_index :followings, :user_id
  end
  
end
