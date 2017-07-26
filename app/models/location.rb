class Location < ActiveRecord::Base
  validates :name, :zip, presence: true
  validates :zip, length: { is: 5 }
  belongs_to :user

end
