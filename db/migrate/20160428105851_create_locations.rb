class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :zip, null: false
      t.text	 :note
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
