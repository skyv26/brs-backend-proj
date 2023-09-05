class AddForeignKeysToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :bus, null: false, foreign_key: true, type: :uuid
    add_reference :reservations, :user, null: false, foreign_key: true, type: :uuid
  end
end
