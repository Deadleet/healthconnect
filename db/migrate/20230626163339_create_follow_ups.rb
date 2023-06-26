class CreateFollowUps < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_ups do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :posology
      t.integer :hourly_frequency
      t.integer :day_frequency
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
