class ChangeColumsToAppointements < ActiveRecord::Migration[7.0]
  def change
    rename_column :appointments, :date, :appointment_date
    rename_column :appointments, :time, :appointment_time
  end
end
