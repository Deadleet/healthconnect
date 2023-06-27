class PathoPrescription < ApplicationRecord
  belongs_to :pathologie
  belongs_to :prescription
end
