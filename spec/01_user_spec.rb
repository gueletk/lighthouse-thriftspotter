require './spec_helper'
require 'bcrypt'

describe User do
  before :each do
    password_salt = BCrypt::Engine.generate_salt
    @good_user = User.new(
      name: Faker::Name.name,
      username: Faker::Name.name.downcase,
      password_salt: password_salt,
      password_hash: BCrypt::Engine.hash_secret('password', password_salt),
      email: Faker::Internet.email
    )
    @bad_user = User.new(
      password_hash: BCrypt::Engine.hash_secret('otherpassword', password_salt),
      password_salt: password_salt,
    )
  end

  it "should save successfully with valid user data" do
    expect(@good_user.save).to eq(true)
  end

  it "should not save successfully with invalid email" do
    @bad_user.attributes = {
      name: Faker::Name.name,
      username: Faker::Name.name.downcase,
      email: "iamnotanemail"
    }
    expect(@bad_user.save).to eq(false)
  end
end
