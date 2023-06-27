class CreateMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :measures do |t|
      t.string :title
      t.text :description
      t.decimal :valeur
      t.string :unit
      t.date :start_date
      t.date :end_date
      t.integer :day_frequency
      t.integer :hourly_frequency
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
