class Comment < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :email, class_name: "Email", foreign_key: "email_id"

  validates :char_began_at, presence: true, :allow_nil => false
  validates :char_ended_at, presence: true, :allow_nil => false

  validates_numericality_of :char_began_at, :only_integer => true, :less_than => :char_ended_at
  validates_numericality_of :char_ended_at, :only_integer => true, :greater_than => :char_began_at

  validate :no_range_overlap, on: :create
  validates :message, presence: true



  has_many :suggestions, dependent: :destroy

  def no_range_overlap
    if email.comments.where("char_began_at < #{char_began_at} AND char_ended_at > #{char_began_at}").count >= 1
      Rails.logger.info("-------------------broke in if")
      errors.add(:char_ended_at, "can't")
      Rails.logger.info(errors)
    elsif email.comments.where("char_began_at > #{char_began_at} AND char_began_at < #{char_ended_at}").count >= 1
    # email comments where beginning charactaer is greater than 
      Rails.logger.info("-------------------broke in elsif")
      errors.add(:char_began_at, "can't")
      Rails.logger.info(errors)
    end
  end

end
