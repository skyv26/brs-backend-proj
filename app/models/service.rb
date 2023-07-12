class Service < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
end
