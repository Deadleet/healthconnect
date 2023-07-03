class AddPracticianToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :practician, :string
  end
end
