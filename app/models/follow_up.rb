class FollowUp < ApplicationRecord
  belongs_to :prescription

  validates :title, presence: true
  validates :description, presence: true
  # validates :start_date, presence: true
  # validates :posology, presence: true


  def start_time
    self.start_date
  end
end
