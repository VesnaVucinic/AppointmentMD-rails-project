class Location < ApplicationRecord
 has_many :physicians
 has_many :physicians, through: :appointments
 has_many :patients
 has_many :patients, through: :appointments
end
