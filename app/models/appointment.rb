class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :practician, class_name: 'User'
end
