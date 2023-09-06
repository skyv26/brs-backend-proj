class ChangeStatusDefaultToTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, :boolean, default: true, null: true
    change_column :reservations, :refund_status, :string, default: 'Not Applicable', null: true
    change_column :reservations, :amount_paid, :decimal, precision: 15, scale: 2, default: nil
  end
end
