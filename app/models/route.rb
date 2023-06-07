class Route < ApplicationRecord
  belongs_to :station, foreign_key: 'start_station_id'
  belongs_to :station, foreign_key: 'destination_station_id'
  validates :distance, presence: true, numericality: { only_integer: true }
  validates :time_duration, presence: true, numericality: { only_integer: true }
  validates :departure_time, presence: true
  validate :departure_time_is_valid_datetime

  def departure_time_is_valid_datetime
    DateTime.parse(departure_time.to_s)
  rescue ArgumentError
    errors.add(:departure_time, 'must be a valid datetime')
  end
end
