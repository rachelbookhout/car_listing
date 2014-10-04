require 'rails_helper'
feature "User Creates a Car", %{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do


  scenario "User writes and submits a manufacturer" do
    manufacturer = FactoryGirl.build(:manufacturer)
    visit new_manufacturer_path
    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country
    click_on "Submit"
   expect(page).to have_content "This Manufacturer has been created successfully"
  end

  scenario "User can't submit an empty form" do
    manufacturer = FactoryGirl.build(:manufacturer)
    visit new_manufacturer_path
    click_on "Submit"
    expect(page).to have_content "2 error(s) prevented your manufacturer from being saved"
  end

  scenario "User can't list a duplicate manufacturer" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path
    fill_in "Name", with: manufacturer.name
    fill_in "Country", with: manufacturer.country
    click_on "Submit"
    expect(page).to have_content "Name : We already know about this manufacturer. Please hit the back button to go look at it"
  end

end
