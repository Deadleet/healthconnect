class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.decimal :value
      t.string :unit
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
