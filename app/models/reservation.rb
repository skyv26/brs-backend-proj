class Reservation < ApplicationRecord
    validates :berth_number, presence: true, numericality: true
    validates :refund_status, presence: true
end
