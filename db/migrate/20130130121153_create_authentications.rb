class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :access_token
      t.string :refresh_token
      t.integer :expires_in
      t.references :user
      t.string :uid

      t.timestamps
    end
    add_index :authentications, :user_id
  end
end
