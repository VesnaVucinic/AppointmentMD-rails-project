class AddPasswordToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :password_digest, :string 
  end
end
