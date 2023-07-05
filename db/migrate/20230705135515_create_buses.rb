class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses, id: :uuid do |t|
      t.string :name
      t.string :enquiry_number
      t.integer :bus_number
      t.integer :capacity

      t.timestamps
    end
  end
end
