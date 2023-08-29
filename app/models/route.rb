class Route < ApplicationRecord
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :destination_station, class_name: 'Station', foreign_key: 'destination_station_id'
  validates :distance, presence: true, numericality: { only_integer: true, message: "should be a number" }
  validates :time_duration, presence: true, numericality: { only_integer: true, message: "should be a number" }
  validates :departure_time, presence: true
  validate :departure_time_is_valid_datetime

  def departure_time_is_valid_datetime
    DateTime.parse(departure_time.to_s)
  rescue ArgumentError
    errors.add(:departure_time, message: "must be a valid datetime")
  end

  has_many :bus_routes
  has_many :buses, through: :bus_routes
end
