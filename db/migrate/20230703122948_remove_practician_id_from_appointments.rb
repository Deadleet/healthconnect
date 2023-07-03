class RemovePracticianIdFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :appointments, :practician
  end
end
