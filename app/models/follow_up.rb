class FollowUp < ApplicationRecord
  belongs_to :prescription

  validates :title, presence: true
  validates :description, presence: true
  # validates :start_date, presence: true
  # validates :posology, presence: true


  def start_time
    self.start_date
  end

  def fus_for_calendar
    fus =[]
    (self.start_date..self.end_date).each do |d|
      p d
      intermediate_fu = FollowUp.new(self.attributes)
      intermediate_fu.start_date = d
      fus << intermediate_fu
    end
    fus
  end

  # @follow_ups.map...
    #  fu.fus_for_calendar
end
