class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations, id: :uuid do |t|
      t.string :name
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
