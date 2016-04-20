require './spec_helper'
require 'bcrypt'

describe User do
  before :each do
    password_salt = BCrypt::Engine.generate_salt
    @user = User.new(
      name: Faker::Name.name,
      username: Faker::Name.name.downcase,
      password_salt: password_salt,
      password_hash: BCrypt::Engine.hash_secret('password', password_salt),
      email: Faker::Internet.email
    )
  end

  it "should save successfully with valid user data" do
    expect(@user.save).to eq(true)
  end
end
