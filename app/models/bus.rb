class Bus < ApplicationRecord
  validates :name, presence: true
  validates :bus_number, presence: true
  validates :capacity, presence: true

  validate :validate_bus_name
  validate :validate_bus_enquiry_number
  validate :validate_bus_number
  validate :validate_bus_capacity

  belongs_to :agency, class_name: 'User'  
  has_many :bus_routes
  has_many :routes, through: :bus_routes
  has_many :services, through: :busservices

  private

  def validate_bus_name
    errors.add(:name, 'must be a string') unless name_before_type_cast.is_a?(String)

    return unless name_before_type_cast.is_a?(String)

    if name.size > 40 
      errors.add(:name, 'should not be greater than 50 characters')
    elsif name.size <= 2
      errors.add(:name, 'should be valid and greater than 2 characters')
    end
  end

  def validate_bus_enquiry_number
    errors.add(:enquiry_number, 'must be a string') unless enquiry_number_before_type_cast.is_a?(String)

    return unless enquiry_number_before_type_cast.is_a?(String)

    if enquiry_number.size > 16
      errors.add(:enquiry_number, 'should not be greater than 50 characters')
    elsif enquiry_number.size <= 6
      errors.add(:enquiry_number, 'should be valid and greater than 2 characters')
    end
  end

  def validate_bus_number
    errors.add(:bus_number, 'must be a string') unless bus_number_before_type_cast.is_a?(String)

    return unless bus_number_before_type_cast.is_a?(String)

    if bus_number.size > 16
      errors.add(:bus_number, 'should not be greater than 50 characters')
    elsif bus_number.size <= 6
      errors.add(:bus_number, 'should be valid and greater than 2 characters')
    end
  end

  def validate_bus_capacity
    errors.add(:capacity, 'must be an integer') unless capacity_before_type_cast.is_a?(Integer)
  end
end
