class AddDetailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :real_name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :sex, :integer
    add_column :users, :marriage, :boolean
    add_column :users, :education, :integer
    add_column :users, :signature, :text
    add_column :users, :blog_link, :string
    add_column :users, :qq, :string
    add_column :users, :msn, :string
  end
end
