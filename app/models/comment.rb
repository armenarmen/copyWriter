class Comment < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :email, class_name: "Email", foreign_key: "email_id"

  validates :char_began_at, presence: true, :allow_nil => false
  validates :char_ended_at, presence: true, :allow_nil => false
  
  validates_numericality_of :char_began_at, :only_integer => true
  validates_numericality_of :char_ended_at, :only_integer => true
end
