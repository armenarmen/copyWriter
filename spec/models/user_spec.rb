require 'spec_helper'

describe User do

  it "is valid with full_name, password, and email" do
    user = User.new(
      full_name: "Armen Suny",
      email: "mee@example.com",
      password: "123456789",
      password_confirmation: "123456789"
    )
    expect(user).to be_valid
  end

  it "is invalid without a full_name" do
    user = User.new(
      full_name: nil,
      email: "me@example.com",
      password: "123456789",
      password_confirmation: "123456789"
    )
    expect(user.valid?).to eq false
  end

  it "full_name cannot be the empty string" do
    user = User.new(
      full_name: "",
      email: "me@example.com",
      password: "123456789",
      password_confirmation: "123456789"
    )
    expect(user.valid?).to eq false
  end

  it "is invalid with a full_name over 50 chars" do
    user = User.new(
      full_name: "a" * 51,
      email: "me@example.com",
      password: "123456789",
      password_confirmation: "123456789"
    )
    expect(user.valid?).to eq false
  end

  it "is invalid without a email" do
    user = User.new(
      full_name: "Armen Suny",
      email: nil,
      password: "123456789",
      password_confirmation: "123456789"
    )
    expect(user.valid?).to eq false
  end

  it "is invalid with a duplicate email address" do
    user = User.create(
      full_name: "Armen Suny",
      email: "me@example.com",
      password: "123456789",
      password_confirmation: "123456789"
    )

    user_2 = User.new(
      full_name: "Rajiv Shah",
      email: "me@example.com",
      password: "123456789",
      password_confirmation: "123456789"
    )
    expect(user_2.valid?).to eq false
  end

  it "is invalid without a password" do
    user = User.new(
      full_name: "Armen Suny",
      email: "me@example.com",
      password_confirmation: "123456789"
    )
    expect(user.valid?).to eq false
  end

  it "is invalid without password confirmation"  do
    user = User.new(
      full_name: "Armen Suny",
      email: "me@example.com",
      password: "123456789",
      password_confirmation: nil
    )
    expect(user.valid?).to eq false
  end

  it "is invalid when password is too short" do
    user = User.new(
      full_name: "Armen Suny",
      email: "me@example.com",
      password: "123456",
      password_confirmation: "123456"
    )
    expect(user.valid?).to eq false
  end
end
