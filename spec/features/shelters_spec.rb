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

  describe "shelter create page" do
    it "contains button and inputs" do

      visit "/shelters/new"

      page.should have_no_content('New Sheleter Name')
      expect(page).to have_button("submit")
      fill_in('shelter[name]', :with => 'New Shelter Name')
      fill_in('shelter[address]', :with => '123 Pine')
      fill_in('shelter[city]', :with => 'Denver')
      fill_in('shelter[state]', :with => 'Colorado')
      fill_in('shelter[zip]', :with => 80122 )
    end

    it "creates new shelter" do

      visit "/shelters/new"
      expect(page).to have_current_path("/shelters/new")

      fill_in('shelter[name]', :with => 'New Shelter Name')
      fill_in('shelter[address]', :with => '123 Pine')
      fill_in('shelter[city]', :with => 'Denver')
      fill_in('shelter[state]', :with => 'Colorado')
      fill_in('shelter[zip]', :with => 80122 )
      find_button('submit').click

      expect(page).to have_current_path("/shelters")
      find_link('New Shelter Name').click

      expect(page).to have_content('New Shelter Name')
      expect(page).to have_content('123 Pine')
      expect(page).to have_content('Denver')
      expect(page).to have_content('Colorado')
      expect(page).to have_content(80122)

    end
  end

  describe "shelter id page allowing edit functionality" do
    it "has edit button and redirect to form page with filled form field" do

      visit "/shelters/#{@shelter_1.id}"

      find_link('Edit').visible?
      find_link('Edit').click

      expect(page).to have_current_path("/shelters/#{@shelter_1.id}/edit")
      expect(page).to have_button("submit")
      find_field('shelter[name]')
      find_field('shelter[address]')
      find_field('shelter[city]')
      find_field('shelter[state]')
      find_field('shelter[zip]')
      fill_in('shelter[name]', :with => 'Updated Shelter Name')
      fill_in('shelter[address]', :with => '123 Pine')
      fill_in('shelter[city]', :with => 'Denver')
      fill_in('shelter[state]', :with => 'Colorado')
      fill_in('shelter[zip]', :with => 80123 )
      find_button('submit').click

      expect(page).to have_current_path("/shelters/#{@shelter_1.id}")
      expect(page).to have_content('Updated Shelter Name')
      expect(page).to have_content('123 Pine')
      expect(page).to have_content('Denver')
      expect(page).to have_content('Colorado')
      expect(page).to have_content(80123)


    end
  end

  describe "delete a shelter" do
    it "check if delete button exists and it removes shelter from shelter index" do

      visit "/shelters"

      expect(page).to have_content(@shelter_2.name)

      visit "/shelters/#{@shelter_2.id}"

      find_button('delete')
      find_button('delete').click

      expect(page).to have_current_path("/shelters")
      page.should have_no_content(@shelter_2.name)

    end
  end

end
