class Email < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true
  validates :subject, presence: true
  validates :comment, presence: true

  # belongs_to :user
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  
end
