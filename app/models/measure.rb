class Measure < ApplicationRecord
  belongs_to :prescription
  has_many :measurements, dependent: :destroy

  def start_time
    self.start_date
  end

  def measurements_for_graph
    measurements.pluck(:created_at, :value)
  end

  def measure_for_calendar
    measures = []
    (self.start_date..self.end_date).each do |d|
      intermediate_measure = Measure.new(self.attributes)
      intermediate_measure.start_date = d
      measures << intermediate_measure
    end
    measures
  end
end
