class AddForeignKeysToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :routes, :start_station, foreign_key: { to_table: :stations, on_delete: :cascade }, type: :uuid
    add_reference :routes, :destination_station, foreign_key: { to_table: :stations, on_delete: :cascade }, type: :uuid
  end
end
