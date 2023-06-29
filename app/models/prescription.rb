class Prescription < ApplicationRecord
  belongs_to :user
  has_many :patho_prescriptions, dependent: :destroy
  has_many :follow_ups
  has_many :measures

  validates :title, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def start_time
    self.end_date
  end
end
