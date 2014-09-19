class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
