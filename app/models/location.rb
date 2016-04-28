class Location < ActiveRecord::Base
  validates :name, :zip, presence: true
  belongs_to :user

end
