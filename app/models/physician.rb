class Physician < ApplicationRecord
 has_many :patients
 has_many :pateints, through: :appointments 
end
