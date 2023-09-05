class CreateBusServices < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_services do |t|
      t.references :bus, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
