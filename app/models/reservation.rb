class Reservation < ApplicationRecord
    
    validates :berth_number, presence: true, numericality: true
    validates :refund_status, presence: true
    validates :amount_paid, presence: true, numericality: true
    validate :status_check_func
      
    def status_check_func
        puts status.to_s
    end
end
