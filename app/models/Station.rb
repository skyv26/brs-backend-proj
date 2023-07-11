class Station < ApplicationRecord
  include StringValidator

  validates :name, presence: true, string: true
  validates :city, presence: true, string: true
  validates :state, presence: true, string: true
end
