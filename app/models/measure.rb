class Measure < ApplicationRecord
  belongs_to :prescription
  has_many :measurements, dependent: :destroy


  def start_time
    self.start_date
  end
end
