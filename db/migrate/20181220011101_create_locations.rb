class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :hours_of_operation
      

      t.timestamps
    end
  end
end
