class RemovePathologyToPathoPrescription < ActiveRecord::Migration[7.0]
  def change
    remove_reference :patho_prescriptions, :pathology, foreign_key: true
    add_reference :patho_prescriptions, :pathologie, foreign_key: true
  end
end
