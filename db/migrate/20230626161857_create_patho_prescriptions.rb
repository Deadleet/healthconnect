class CreatePathoPrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :patho_prescriptions do |t|
      t.references :pathology, null: false, foreign_key: true
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
