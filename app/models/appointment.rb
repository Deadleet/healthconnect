class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :practician, class_name: 'User'

  def start_time
  self.appointment_date
  end
end
