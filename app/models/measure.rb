class Measure < ApplicationRecord
  belongs_to :prescription
  has_many :measurements, dependent: :destroy

  def start_time
    self.start_date
  end

  def measurements_for_graph
    measurements.pluck(:created_at, :value)
  end
end
