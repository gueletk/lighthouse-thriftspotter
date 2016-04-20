class Item < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description, :location
  #validate presence of user once login functionality is set
end
