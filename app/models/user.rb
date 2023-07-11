class User < ApplicationRecord
  validates :full_name, presence: true, length: { maximum: 50 }
  validates :email_address, presence: true, length: { maximum: 128 }
end
