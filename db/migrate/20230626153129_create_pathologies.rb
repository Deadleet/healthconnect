class CreatePathologies < ActiveRecord::Migration[7.0]
  def change
    create_table :pathologies do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
