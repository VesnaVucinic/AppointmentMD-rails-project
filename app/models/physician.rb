class Physician < ApplicationRecord
 has_many :patients
 has_many :pateints, through: :appointments
 validates :name, presence: true
 validates :password, presence: true
 validates :specialty, presence: true
 has_secure_password
end
