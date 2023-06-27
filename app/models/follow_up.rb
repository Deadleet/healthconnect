class FollowUp < ApplicationRecord
  belongs_to :prescription

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :posology, presence: true
end
