require 'geocoder/models/active_record'
class Item < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  
  geocoded_by :location  # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates


  validates_presence_of :title, :description, :location, :image_path, :user

  validates :title,
    length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :description, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }
  validates :price, numericality: { only_integer: true, greater_than: 0, :allow_blank => true }

  def num_likes
    likes = Like.group(:item_id).count[id]
    likes ? likes : 0
  end

  def belongs_to?(check_user)
    check_user == user
  end

end
