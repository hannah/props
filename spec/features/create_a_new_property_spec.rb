require 'spec_helper'

feature 'recording a building', %q(
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information) do

  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'user creates a new valid property' do
    visit new_property_path
    fill_in 'Street address', with: '123 Code Lane'
    fill_in 'City', with: 'Thebestcity'
    fill_in 'State', with: 'MA'
    fill_in 'Description', with: 'This is the best house to buy'

    click_on 'Create Property'
    expect(page).to have_content("New Property Created")
    expect(page).to_not have_content("can't be blank")
  end

end
