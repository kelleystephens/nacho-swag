class AddRentedToItems < ActiveRecord::Migration
  def change
    add_column :items, :rented, :boolean
  end
end
