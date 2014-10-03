class Car < ActiveRecord::Base
   belongs_to :manufacturer
   validates :manufacturer_id, presence:true
   validates :color, presence:true
   validates :year, presence:true # needs to be above 1920
   validates_numericality_of :year, greater_than 1920
   validates :mileage, presence:true
   validates :description
end