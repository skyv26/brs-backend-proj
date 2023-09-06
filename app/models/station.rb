class Station < ApplicationRecord
  include StringValidator
  has_many :routes, foreign_key: 'start_station'
  has_many :routes, foreign_key: 'destination_station'
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validate :validate_name_type
  validate :validate_city_type
  validate :validate_state_type

  private

  def validate_name_type
    errors.add(:name, 'must be a string') unless name_before_type_cast.is_a?(String)
    return unless name_before_type_cast.is_a?(String)
   
    if name.size > 20
      errors.add(:name, 'should not be greater than 20 characters')
    elsif name.size <= 2
      errors.add(:name, 'should be valid and greater than 2 characters')
    end
  end

  def validate_city_type
    errors.add(:city, 'must be a string') unless city_before_type_cast.is_a?(String)
    return unless city_before_type_cast.is_a?(String)
   
    if city.size > 20
      errors.add(:city, 'should not be greater than 20 characters')
    elsif city.size <= 2
      errors.add(:city, 'should be valid and greater than 2 characters')
    end
  end

  def validate_state_type
    errors.add(:state, 'must be a string') unless state_before_type_cast.is_a?(String)
    return unless state_before_type_cast.is_a?(String)
   
    if state.size > 20
      errors.add(:state, 'should not be greater than 20 characters')
    elsif state.size <= 2
      errors.add(:state, 'should be valid and greater than 2 characters')
    end
  end
end
