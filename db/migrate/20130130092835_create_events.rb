class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.datetime :time
      t.integer :duration
      t.integer :visibility
      t.references :owner
      
      t.string :type

      t.timestamps
    end
    add_index :events, :owner_id
  end
end
