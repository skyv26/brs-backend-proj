require 'uri'

class User < ApplicationRecord
  validates :full_name, presence: true
  validates :email_address, presence: true

  validate :validate_full_name
  validate :validate_email_address
  validate :validate_date_of_birth

  private

  def validate_full_name
    errors.add(:full_name, 'must be a string') unless full_name_before_type_cast.is_a?(String)

    return unless full_name.is_a?(String)

    if full_name.size > 20
      errors.add(:full_name, 'should not be greater than 50 characters')
    elsif full_name.size <= 2
      errors.add(:full_name, 'should be valid and greater than 2 characters')
    end
  end

  def validate_email_address
    errors.add(:email_address, 'must be a string') unless email_address_before_type_cast.is_a?(String)

    return unless email_address.is_a?(String)

    if email_address.size > 128
      errors.add(:email_address, 'should not be greater than 128 characters')
    elsif !email_address.match?(URI::MailTo::EMAIL_REGEXP)
      errors.add(:email_address, 'should be a valid email address')
    end
  end

  def validate_date_of_birth
    return if date_of_birth_before_type_cast.is_a?(String)

    errors.add(:date_of_birth, 'must be a string')
  end
end
