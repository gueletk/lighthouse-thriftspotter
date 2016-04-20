require './spec_helper'
require 'bcrypt'

describe Item do
  before :each do
    @item = Item.new(
      title: Faker::Lorem.characters(30),
      description: Faker::Lorem.characters(250),
      location: Faker::Lorem.characters(30),
    )

  end

  describe "#title" do
    it "should have a title" do

    end

    it "should not be more than 50 characters" do
    end
  end

  describe "#description" do
    it "should have a description" do
    end

    it "should not be more than 300 characters" do
    end
  end

  describe "#price" do
    it "should be an integer" do
    end
  end

  describe "#location" do
    it "should have a location" do
    end

    it "should not be more than 50 characters" do
    end
  end

end