class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :address, presence: true
  validates :telnr, presence: true
end
