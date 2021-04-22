class User < ApplicationRecord
  has_many :tickets

  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :email, uniqueness: true
end
