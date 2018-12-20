class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :age
      t.string :height
      t.string :date_of_birth
      t.timestamps
    end
  end
end
