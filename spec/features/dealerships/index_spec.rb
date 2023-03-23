require 'rails_helper'

RSpec.describe '/dealerships', type: :feature do
  before(:each) do
    Dealership.create!(name: "Test Dealership", has_stock: true, cars_available: 1)
    Dealership.create!(name: "Test Dealership 2", has_stock: false, cars_available: 0)
  end

  describe "as a visitor, when i visit the dealership index page" do
    #User Story 1 - Parent Index
    it 'shows each dealership name' do
      visit '/dealerships'
      
      expect(page).to have_content("Test Dealership")
      expect(page).to have_content("Test Dealership 2")
    end
  end
    # User Story 2 - Parent Show
    it 'shows the dealership information on a specific dealership' do
      visit '/dealerships/1'
      
      expect(page).to have_content("Test Dealership")
      expect(page).to have_content("true")
      expect(page).to have_content("1")
    end
end