class Station < ApplicationRecord
  include StringValidator
  has_many :routes, foreign_key: 'start_station_id'
  has_many :routes, foreign_key: 'destination_station_id'
  validate :name_validity
  validate :city_validity
  validate :state_validity

  private

  def name_validity
    errors.add(:name, 'is a required property') unless name.present?

    if name_before_type_cast.is_a?(Integer) || name_before_type_cast.is_a?(TrueClass) || name_before_type_cast.is_a?(FalseClass) || name_before_type_cast.is_a?(NilClass)
      errors.add(:name, 'must be a string')
    elsif name.size > 20
      errors.add(:name, 'should not be greater than 20 characters')
    elsif name.size <= 2
      errors.add(:name, 'should be valid and greater than 2 characters')
    end
  end

  def city_validity
    errors.add(:city, 'is a required property') unless city.present?

    if city_before_type_cast.is_a?(Integer) || city_before_type_cast.is_a?(TrueClass) || city_before_type_cast.is_a?(FalseClass) || city_before_type_cast.is_a?(NilClass)
      errors.add(:city, 'must be a string')
    elsif city.size > 20
      errors.add(:city, 'should not be greater than 20 characters')
    elsif city.size <= 2
      errors.add(:city, 'should be valid and greater than 2 characters')
    end
  end

  def state_validity
    errors.add(:state, 'is a required property') unless state.present?

    if state_before_type_cast.is_a?(Integer) || state_before_type_cast.is_a?(TrueClass) || state_before_type_cast.is_a?(FalseClass) || state_before_type_cast.is_a?(NilClass)
      errors.add(:state, 'must be a string')
    elsif state.length > 20
      errors.add(:state, 'should not be greater than 20 characters')
    elsif state.length <= 2
      errors.add(:state, 'should be valid and greater than 2 characters')
    end
  end
end
