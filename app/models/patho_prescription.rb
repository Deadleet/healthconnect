class PathoPrescription < ApplicationRecord
  belongs_to :pathology
  belongs_to :prescription
end
