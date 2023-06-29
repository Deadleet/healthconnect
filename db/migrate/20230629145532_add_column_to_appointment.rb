class AddColumnToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :time, :time
    add_column :appointments, :address, :string
    add_column :appointments, :practician, :string
  end
end
