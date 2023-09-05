class Bus < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :bus_number, presence: true, format: { with: /\A\w+\z/, message: 'should be alphanumeric' }
  validates :capacity, presence: true, numericality: { only_numeric: true } \

  belongs_to :agency, class_name: 'User'  
  has_many :bus_routes
  has_many :routes, through: :bus_routes
  has_many :services, through: :busservices
end
