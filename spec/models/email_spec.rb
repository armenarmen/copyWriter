require 'spec_helper'

describe Email do
  before do
    @user = User.create(
      full_name: "Armen Suny",
      email: Faker::Internet.email,
      password: "123456789",
      password_confirmation: "123456789"
    )
  end
  
  it "is valid with user_id, body, subject" do
    my_email = @user.emails.create(subject: 'ass', body:"ass")
    expect(my_email).to be_valid
  end

  it "is accepts a 'comment' attribute" do
    my_email = @user.emails.create(subject: 'ass', body:"ass", comment: "is good?")
    expect(my_email).to be_valid
  end

  it "is not valid without subject" do
    my_email = @user.emails.create(subject: nil, body:'great')
    expect(my_email.valid?).to eq false
  end

  it "is not valid without body" do
    my_email = @user.emails.create(subject: 'ass', body:nil)
    expect(my_email.valid?).to eq false
  end

end