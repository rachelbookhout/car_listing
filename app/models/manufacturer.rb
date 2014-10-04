class Manufacturer < ActiveRecord::Base
  has_many :cars
  validates :name,
    presence: true,
    uniqueness: {message: ": We already know about this manufacturer. Please hit the back button to go look at it"}
  validates :country, presence:true
end
