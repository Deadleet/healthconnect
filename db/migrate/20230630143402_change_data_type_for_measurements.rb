class ChangeDataTypeForMeasurements < ActiveRecord::Migration[7.0]
  def change
    change_column :measurements, :value, :string
  end
end
