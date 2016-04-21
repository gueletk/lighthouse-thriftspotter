class User < ActiveRecord::Base

  has_many :items, :dependent => :delete_all
  has_many :likes, :dependent => :delete_all

  validates_presence_of :username, :name, :password_hash
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :email, uniqueness: true

  before_validation { self.email.downcase! }

  def has_liked(search_item)
    likes.detect{|like| like.item_id == search_item.id}
  end

  def liked_items
    likes.map{|like| Item.find_by(id: like.item_id)}
  end

end
