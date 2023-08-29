class Route < ApplicationRecord
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :destination_station, class_name: 'Station', foreign_key: 'destination_station_id'
  validate :distance_should_be_number

  validates :time_duration, presence: true, numericality: { only_integer: true, message: "should be a number" }
  validates :departure_time, presence: true
  validate :departure_time_is_valid_datetime

  has_many :bus_routes
  has_many :buses, through: :bus_routes

  private
  
  def distance_should_be_number
    unless distance.present?
      errors.add(:distance, "is a required property")
    end

    if distance_before_type_cast.is_a?(String)
      errors.add(:distance, "must be an integer, not a string")
    end
  end

  def departure_time_is_valid_datetime
    DateTime.parse(departure_time.to_s)
  rescue ArgumentError
    errors.add(:departure_time, message: "must be a valid datetime")
  end
end
