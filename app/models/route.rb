class Route < ApplicationRecord
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :destination_station, class_name: 'Station', foreign_key: 'destination_station_id'
  validate :distance_validity
  validate :time_duration_validity
  validates :departure_time, presence: true
  validate :departure_time_is_valid_datetime

  has_many :bus_routes
  has_many :buses, through: :bus_routes

  private

  def distance_validity
    errors.add(:distance, 'is a required property') unless distance.present?

    return unless distance_before_type_cast.is_a?(String)

    errors.add(:distance, 'must be an integer, not a string')
  end

  def time_duration_validity
    errors.add(:time_duration, 'is a required property') unless time_duration.present?

    return unless time_duration_before_type_cast.is_a?(String)

    errors.add(:time_duration, 'must be an integer, not a string')
  end

  def departure_time_validity
    DateTime.parse(departure_time.to_s)
  rescue ArgumentError
    errors.add(:departure_time, message: 'must be a valid datetime')
  end
end
