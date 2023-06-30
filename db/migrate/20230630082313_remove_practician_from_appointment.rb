class RemovePracticianFromAppointment < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :practician, :string
  end
end
