class ChangeStatusDefaultToTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, :boolean, default: true
  end
end
