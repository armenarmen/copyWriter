class Email < ActiveRecord::Base
  validates :user_id, presence: true
  validates :body, presence: true
  validates :subject, presence: true

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :comments, dependent: :destroy

  def render_comments
    ApplicationController.new.render_to_string(
      layout: false,
      template: '/emails/comments',
      locals: { :@email => self, :@comments => self.comments.order('char_ended_at DESC') }
    )
  end
end
