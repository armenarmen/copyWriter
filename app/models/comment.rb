class Comment < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :email, class_name: "Email", foreign_key: "email_id"
end
