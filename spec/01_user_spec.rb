require './spec_helper'

describe User do
  before :each do
    @user = User.new(
      name: Faker::Name.name,
      username: Faker::Name.name.downcase,
      password_hash: 
    )

    t.string   "username"
    t.string   "name"
    t.string   "password_hash"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
