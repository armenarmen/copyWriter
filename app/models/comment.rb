class Comment < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :email, class_name: "Email", foreign_key: "email_id"

  validates :char_began_at, presence: true, :allow_nil => false
  validates :char_ended_at, presence: true, :allow_nil => false
  
  validates_numericality_of :char_began_at, :only_integer => true
  validates_numericality_of :char_ended_at, :only_integer => true

  validate :no_range_overlap, on: :create

  before_create :no_range_overlap

  def no_range_overlap
    # if char_began_at == 0
    #   errors.add(:char_began_at, "can't be in the past")
    # end

    # comment in same range eliminate
    comments = self.email.comments
    if comments.where("char_began_at = #{char_began_at} AND char_ended_at = #{char_ended_at}").count >= 1
      # true# We have another comment covering the exact same text range.  Allow this.
    elsif comments.where("char_began_at < #{char_began_at} AND char_ended_at > #{char_began_at}").count >= 1
      # Barf.
      errors.add(:char_ended_at, "can't")
      # false
    elsif comments.where("char_began_at < #{char_ended_at}").count >= 1
      # Barf.
      errors.add(:char_began_at, "can't")
      # false
    end
    true
  end

  def char_range
    (self.char_began_at..self.char_ended_at).to_a
  end
end
