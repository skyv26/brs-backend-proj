class Reservation < ApplicationRecord
    validates :berth_number, presence: true, numericality: true
    validates :refund_status, presence: true
    validates :amount_paid, presence: true, numericality: true
    validates :status, presence: true, boolean: true
end
