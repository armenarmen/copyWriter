class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :full_name, length: { maximum: 50 }
  validates :full_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true

  has_many :emails, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
