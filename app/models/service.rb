class Service < ApplicationRecord
  validate :validate_name_type
  validate :validate_icon_type
  private

  def validate_name_type
    if name_before_type_cast.is_a?(Integer) ||
      name_before_type_cast.is_a?(TrueClass) ||
      name_before_type_cast.is_a?(FalseClass) ||
      name_before_type_cast.is_a?(NilClass)
     errors.add(:name, 'must be a string')
   end
  end

  def validate_name_presence
    errors.add(:name, 'is a required property') unless name.present?
  end

  def validate_icon_type
    if icon_before_type_cast.is_a?(Integer) ||
      icon_before_type_cast.is_a?(TrueClass) ||
      icon_before_type_cast.is_a?(FalseClass) ||
      icon_before_type_cast.is_a?(NilClass)
     errors.add(:icon, 'must be a string')
   end
  end

  def validate_icon_presence
    errors.add(:icon, 'is a required property') unless icon.present?
  end
end