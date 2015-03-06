class Email < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true
  validates :subject, presence: true
  validates :comment, presence: true
end
