class CreateBusRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_routes, id: :uuid do |t|
      t.references :bus, type: :uuid, foreign_key:true
      t.references :route,type: :uuid, foreign_key:true

      t.timestamps
    end
  end
end
