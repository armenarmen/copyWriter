class Post < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true

end
