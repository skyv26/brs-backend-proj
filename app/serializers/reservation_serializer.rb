class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :berth_number, :refund_status, :amount_paid, :status, :user, :bus
end
