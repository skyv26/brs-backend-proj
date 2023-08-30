class Station < ApplicationRecord
  include StringValidator
  has_many :routes, foreign_key: 'start_station'
  has_many :routes, foreign_key: 'destination_station'
  validate :validate_name_type
  validate :validate_city_type
  validate :validate_state_type

  private

  def validate_name_type
    if name_before_type_cast.is_a?(Integer) ||
       name_before_type_cast.is_a?(TrueClass) ||
       name_before_type_cast.is_a?(FalseClass) ||
       name_before_type_cast.is_a?(NilClass)
      errors.add(:name, 'must be a string')
    end
  end

  def validate_name_length
    if name.size > 20
      errors.add(:name, 'should not be greater than 20 characters')
    elsif name.size <= 2
      errors.add(:name, 'should be valid and greater than 2 characters')
    end
  end

  def validate_city_type
    if city_before_type_cast.is_a?(Integer) ||
       city_before_type_cast.is_a?(TrueClass) ||
       city_before_type_cast.is_a?(FalseClass) ||
       city_before_type_cast.is_a?(NilClass)
      errors.add(:city, 'must be a string')
    end
  end

  def validate_city_length
    if city.size > 20
      errors.add(:city, 'should not be greater than 20 characters')
    elsif city.size <= 2
      errors.add(:city, 'should be valid and greater than 2 characters')
    end
  end

  def validate_state_type
    if state_before_type_cast.is_a?(Integer) ||
       state_before_type_cast.is_a?(TrueClass) ||
       state_before_type_cast.is_a?(FalseClass) ||
       state_before_type_cast.is_a?(NilClass)
      errors.add(:state, 'must be a string')
    end
  end

  def validate_state_length
    if state.size > 20
      errors.add(:state, 'should not be greater than 20 characters')
    elsif state.size <= 2
      errors.add(:state, 'should be valid and greater than 2 characters')
    end
  end
end
