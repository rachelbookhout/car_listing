FactoryGirl.define do

  factory :car do
    sequence :manufacturer_id do |n|
      "#{n}"
    end
    color "blue"
    year "2000"
    mileage "2000"
    description "Awesome Car"
  end

  factory :manufacturer do
    sequence :name do |n|
      "X{n}"
    end
    country "USA"
  end

end




