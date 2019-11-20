require 'rails_helper'

describe "shelters story tests", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Save Cats",
                              address: "123 Pine",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80112)
    @shelter_2 = Shelter.create(name: "Save Dogs",
                              address: "134 Pine",
                              city: "Littleton",
                              state: "Colorado",
                              zip: 80111)
  end

  describe "shelters index page" do
    it "show all shelters" do

      visit '/shelters/'

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)

    end
  end

  describe "shelter id page" do
    it "show shelter (id) page and details" do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.zip)

      visit "/shelters/#{@shelter_2.id}"

      expect(page).to have_content(@shelter_2.address)
      expect(page).to have_content(@shelter_2.address)
      expect(page).to have_content(@shelter_2.city)
      expect(page).to have_content(@shelter_2.zip)

    end
  end
end
