class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :title
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :practician, null: false, foreign_key: {to_table: "users"}

      t.timestamps
    end
  end
end
