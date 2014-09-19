class CreateRentedItems < ActiveRecord::Migration
  def change
    create_table :rented_items do |t|
      t.references :user, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
