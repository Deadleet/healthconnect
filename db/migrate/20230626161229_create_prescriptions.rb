class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :practician
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
