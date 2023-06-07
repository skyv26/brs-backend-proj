class Station < ApplicationRecord
  include StringValidator
  has_many :routes, foreign_key: 'start_station_id'
  has_many :routes, foreign_key: 'destination_station_id'
  validates :name, presence: true, string: true
  validates :city, presence: true, string: true
  validates :state, presence: true, string: true
end
