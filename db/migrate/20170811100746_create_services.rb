class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :service_name, null: false
      t.integer :service_type, array: true, default: [] # возможно несколько типов услуг
      t.string :service_address, null: false
      t.string :service_phonenumber, null: false

      t.index [:service_name, :service_address], unique: true
      t.index [:service_name, :service_phonenumber], unique: true

      t.timestamps null: false
    end
  end
end
