class Reservation < ApplicationRecord
  include BooleanValidator
  validates :berth_number, presence: true, numericality: true
  validates :refund_status, presence: true, inclusion: { in: %w(string values) }
  validates :amount_paid, presence: true, numericality: true
  validates :status, presence: true, boolean: true
end
