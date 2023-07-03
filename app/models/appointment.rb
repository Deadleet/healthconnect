class Appointment < ApplicationRecord
  belongs_to :user

  validates :appointment_date, presence: true
  validates :title, presence: true

  def start_time
  self.appointment_date
  end
end
