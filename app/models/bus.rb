class Bus < ApplicationRecord
  validates :name, presence: true
  validates :bus_number, presence: true, format: { with: /\A\w+\z/, message: 'should be alphanumeric' }
  validates :capacity, presence: true, numericality: { only_numeric: true }

  validate :validate_bus_name

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
end
