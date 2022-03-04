# frozen_string_literal: true
# アカウント
class Account < ApplicationRecord
  include JWT::Authenticatable

  has_secure_password

  # Validations
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
