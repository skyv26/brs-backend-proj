class Reservation < ApplicationRecord
  validates :berth_number, presence: true, numericality: true
  validates :refund_status, presence: true
  validates :amount_paid, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: [true, false], message: 'must be a boolean' }
end
