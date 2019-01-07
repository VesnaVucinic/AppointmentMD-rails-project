class Physician < ApplicationRecord
 has_many :patients
 has_many :patients, through: :appointments
 has_many :locations
 has_many :locations, through: :appointments
 has_many :appointments
 validates :name, presence: true
 validates :email, presence: true
 validates :password, presence: true
 validates :specialty, presence: true
 has_secure_password
end
