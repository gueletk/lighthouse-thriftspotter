class Item < ActiveRecord::Base

  belongs_to :user
  has_many :likes, :dependent => :delete_all

  validates_presence_of :title, :description, :location
  #validate presence of user once login functionality is set

  validates :title, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :description, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }
  validates :location, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :price, numericality: { only_integer: true, greater_than: 0, :allow_blank => true }

end
