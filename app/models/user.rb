class User < ApplicationRecord
  enum role: [:user, :admin]
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 12 }, if: :password_required?
  validates :email, presence: true
  validates :address, presence: true
  validates :telnr, presence: true

  def password_required?
    new_record? || !password.nil? || !password_confirmation.nil?
  end
end
