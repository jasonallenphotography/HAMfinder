class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :name, :password, :email, presence: true, on: :create
  validates :password, length: { minimum: 4, maximum: 20 }, on: :create
  validates :name, :email, presence: true, on: :update
  has_secure_password
  has_many :locations

  def has_locations?
    self.locations.length > 0
  end
end
