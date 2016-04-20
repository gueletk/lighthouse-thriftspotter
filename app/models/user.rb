class User < ActiveRecord::Base
  has_many :items

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  before_validation { self.email.downcase! }

end
