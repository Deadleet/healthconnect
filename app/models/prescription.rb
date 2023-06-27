class Prescription < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
