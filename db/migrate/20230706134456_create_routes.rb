class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes, id: :uuid do |t|
      t.integer :distance
      t.string :duration
      t.time :departure_time

      t.timestamps
    end
  end
end
