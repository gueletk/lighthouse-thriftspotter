class User < ActiveRecord::Base

  has_many :items

  validates_presence_of :username, :name, :password_hash
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :email, uniqueness: true

  before_validation { self.email.downcase! }

end
