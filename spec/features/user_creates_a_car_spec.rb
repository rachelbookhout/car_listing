require 'rails_helper'
feature "User Creates a Car", %{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do


  scenario "User writes and submits a car" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_car_path
    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: "yellow"
    fill_in "Year", with: "1999"
    fill_in "Mileage", with: "1222"
    click_on "Submit"
    expect(page).to have_content "This Car has been created successfully"
  end

  scenario "User can't submit an empty form" do
    car = FactoryGirl.create(:car)
    visit new_car_path
    click_on "Submit"
    expect(page).to have_content "5 error(s) prevented your car from being saved"
  end

  scenario "User can't list a car with year less than 1920" do
    car = FactoryGirl.create(:car)
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_car_path
    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: car.color
    fill_in "Year", with: "1888"
    fill_in "Mileage", with: car.mileage
    click_on "Submit"
   expect(page).to have_content "Year must be greater than 1920"
  end


end
