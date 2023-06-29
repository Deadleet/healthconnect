class Measure < ApplicationRecord
  belongs_to :prescription
  has_many :measurements, dependent: :destroy
end
