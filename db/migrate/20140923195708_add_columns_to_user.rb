class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :hometown, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :interests, :text
    add_column :users, :image, :string
    add_column :users, :links, :text
    add_column :users, :locales, :text
    add_column :users, :going, :text
  end
end
