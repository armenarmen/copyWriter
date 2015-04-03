require 'spec_helper'

describe Comment do
  before do
    @user = User.create(
      full_name: "Armen Suny",
      email: Faker::Internet.email,
      password: "123456789",
      password_confirmation: "123456789"
    )

    @email = @user.emails.create(subject: 'ass', body:"this is a long ass body for this email I tell yawhat")
  end

  it "is valid with message, char_began_at, char_ended_at" do
    comment = @email.comments.new(message: "great line", char_began_at: 10, char_ended_at: 15)
    expect(comment).to be_valid
  end

  it "is not valid without message" do
    comment = @email.comments.new(message: nil, char_began_at: 10, char_ended_at: 15)
    expect(comment.valid?).to eq false
  end

  it "char_began_at cannot be greater than char_ended_at" do
    comment = @email.comments.new(message: "great line", char_began_at: 15, char_ended_at: 10)
    expect(comment.valid?).to eq false
  end

  it "cannot be made entirely inside of an existing comment" do
    comment_orig = @email.comments.create(message: "great line", char_began_at: 1, char_ended_at: 15)
    comment = @email.comments.new(message: "great line", char_began_at: 10, char_ended_at: 15)
    expect(comment.valid?).to eq false
  end

  it "cannot start inside an existing comment" do
    comment_orig = @email.comments.create(message: "great line", char_began_at: 1, char_ended_at: 15)
    comment = @email.comments.new(message: "great line", char_began_at: 10, char_ended_at: 20)
    expect(comment.valid?).to eq false
  end

  it "cannot end inside an existing comment" do
    comment_orig = @email.comments.create(message: "great line", char_began_at: 10, char_ended_at: 25)
    comment = @email.comments.new(message: "great line", char_began_at: 1, char_ended_at: 15)
    expect(comment.valid?).to eq false
  end

  it "cannot encompass an existing comment" do
    comment_orig = @email.comments.create(message: "great line", char_began_at: 10, char_ended_at: 25)
    comment = @email.comments.new(message: "great line", char_began_at: 9, char_ended_at: 26)
    expect(comment.valid?).to eq false
  end

  it "char_began_at and char_ended_at cannot be the same" do
    comment = @email.comments.new(message: "great line", char_began_at: 15, char_ended_at: 15)
    expect(comment.valid?).to eq false
  end
  
end