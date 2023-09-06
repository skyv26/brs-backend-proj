class Reservation < ApplicationRecord
  validates :berth_number, presence: true
  validates :amount_paid, presence: true, numericality: true
  validates :status, presence: true

  validate :validate_reservation_berth_number
  validate :validate_reservation_refund_status
  validate :validate_reservation_status

  belongs_to :user
  belongs_to :bus

  private

  def validate_reservation_berth_number
    errors.add(:berth_number, 'must be an integer') unless berth_number_before_type_cast.is_a?(Integer)
  end

  def validate_reservation_refund_status
    errors.add(:refund_status, 'must be a string') unless refund_status_before_type_cast.is_a?(String)

    return unless refund_status_before_type_cast.is_a?(String)

    if refund_status.size > 250
      errors.add(:refund_status, 'should not be greater than 250 characters')
    elsif refund_status.size <= 10
      errors.add(:refund_status, 'should be greater than 10 characters')
    end
  end

  def validate_reservation_status
    return if status.blank? # Allow nil or empty value

    unless status_before_type_cast.is_a?(TrueClass) ||
           status_before_type_cast.is_a?(FalseClass)
      errors.add(:status, 'must be a boolean either true or false')
    end

    unless status.is_a?(TrueClass) ||
           status.is_a?(FalseClass)
      errors.add(:status, 'must be a boolean either true or false')
    end
  end
end
