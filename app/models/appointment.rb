class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :practician, class_name: 'User'

  validates :appointment_date, presence: true
  validates :title, presence: true

  def start_time
  self.appointment_date
  end
end
