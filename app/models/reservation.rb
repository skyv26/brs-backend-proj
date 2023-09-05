class Reservation < ApplicationRecord
  validates :berth_number, presence: true
  validates :refund_status, presence: true
  validates :amount_paid, presence: true
  validates :status, presence: true

  validate :validate_berth_number
  validate :validate_refund_status
  validate :validate_amount_paid
  validate :validate_status

  belongs_to :user
  belongs_to :bus

  private

  def validate_berth_number
    errors.add(:berth_number, 'must be an integer') unless berth_number_before_type_cast.is_a?(Integer)
  end

  def validate_amount_paid
    errors.add(:amount_paid, 'must be an integer') unless amount_paid_before_type_cast.is_a?(Integer)
  end

  def validate_refund_status
    errors.add(:refund_status, 'must be a string') unless refund_status_before_type_cast.is_a?(String)

    return unless refund_status_before_type_cast.is_a?(String)

    if refund_status.size > 250
      errors.add(:refund_status, 'should not be greater than 250 characters')
    elsif refund_status.size <= 30
      errors.add(:refund_status, 'should be greater than 30 characters')
    end
  end

  def validate_status
    errors.add(:refund_status, 'must be either true or false') unless status_before_type_cast.is_a?(TrueClass) || status_before_type_cast.is_a?(FalseClass)
  end
end
