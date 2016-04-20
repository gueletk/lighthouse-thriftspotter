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
      @item.title = nil
      expect(@item).to_not be_valid
      expect(@item.errors[:title]).to include "can't be blank"
    end

    it "should not be more than 50 characters" do
      @item.title = Faker::Lorem.characters(51)
      expect(@item).to_not be_valid
      expect(@item.errors[:titles]).to include 'is too long (maximum is 50 characters)'
    end
  end

  describe "#description" do
    it "should have a description" do
      @item.description = nil
      expect(@item).to_not be_valid
      expect(@item.errors[:description]).to include "can't be blank"   
    end

    it "should not be more than 300 characters" do
      @item.description = Faker::Lorem.characters(301)
      expect(@item).to_not be_valid
      expect(@item.errors[:description]).to include 'is too long (maximum is 300 characters)'
    end
  end

  describe "#price" do
   it 'must be a number (integer) only' do
     @item.price = 'abc'
     expect(@item).to_not be_valid
     expect(@item.errors[:price]).to include 'is not a number'
   end
  end

  describe "#location" do
    it "should have a location" do
      @item.location = nil
      expect(@item).to_not be_valid
      expect(@item.errors[:location]).to include "can't be blank"     
    end

    it "should not be more than 50 characters" do
      @item.location = Faker::Lorem.characters(51)
      expect(@item).to_not be_valid
      expect(@item.errors[:location]).to include 'is too long (maximum is 50 characters)'      
    end
  end

end