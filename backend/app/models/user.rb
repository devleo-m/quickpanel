class User < ApplicationRecord
  belongs_to :role
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private

  def password_required?
    new_record? || !password.nil?
  end
end
