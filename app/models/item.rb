class Item < ActiveRecord::Base

  belongs_to :user
  has_many :likes, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all

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
