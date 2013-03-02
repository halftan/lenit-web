class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.references :manager
      t.text :description

      t.timestamps
    end
    add_index :providers, :manager_id
  end
end
