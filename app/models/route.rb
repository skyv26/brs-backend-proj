class Route < ApplicationRecord
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :destination_station, class_name: 'Station', foreign_key: 'destination_station_id'
  validate :validate_distance_presence, :validate_distance_type
  validate :validate_time_duration_presence, :validate_time_duration_type
  validates :departure_time, presence: true
  validate :departure_time_validity

  has_many :bus_routes, dependent: :destroy
  has_many :buses, through: :bus_routes

  private

  def validate_distance_type
    if distance_before_type_cast.is_a?(String) ||
       distance_before_type_cast.is_a?(TrueClass) ||
       distance_before_type_cast.is_a?(FalseClass) ||
       distance_before_type_cast.is_a?(NilClass)
      errors.add(:distance, 'must be an integer')
    end
  end

  def validate_distance_presence
    errors.add(:distance, 'is a required property') unless distance.present?
  end

  def validate_time_duration_type
    if time_duration_before_type_cast.is_a?(String) ||
       time_duration_before_type_cast.is_a?(TrueClass) ||
       time_duration_before_type_cast.is_a?(FalseClass) ||
       time_duration_before_type_cast.is_a?(NilClass)
      errors.add(:time_duration, 'must be an integer')
    end
  end

  def validate_time_duration_presence
    errors.add(:time_duration, 'is a required property') unless time_duration.present?
  end

  def departure_time_validity
    DateTime.parse(departure_time.to_s)
  rescue ArgumentError
    errors.add(:departure_time, message: 'must be a valid datetime')
  end
end
