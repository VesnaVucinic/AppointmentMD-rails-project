class Location < ApplicationRecord
 has_many :physicians
 has_many :physicians, through: :appointments
 has_many :patients
 has_many :patients, through: :appointments
 has_many :appointments
 validates :address, presence: true
 validates :hours_of_operation, presence: true
end
