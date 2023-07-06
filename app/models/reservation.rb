class Reservation < ApplicationRecord
    validates :berth_number, presence: true, numericality: true
end
