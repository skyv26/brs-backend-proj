class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations, id: :uuid do |t|
      t.integer :berth_number
      t.string :refund_status
      t.decimal :amount_paid
      t.boolean :status

      t.timestamps
    end
  end
end

# Reservation.create!(berth_number: 2, refund_status: 'Not Applicable', amount_paid: 5.66, status: 'asds')
