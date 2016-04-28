class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :note
      t.integer :zip, null: false
      t.references :user

      t.timestamps null: false
    end
  end
end
