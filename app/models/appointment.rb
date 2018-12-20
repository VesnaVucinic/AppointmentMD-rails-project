class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
  belongs_to :location
  validates :date, presence: true
  validates :time, presence: true 
end
