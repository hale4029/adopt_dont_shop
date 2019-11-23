require 'rails_helper'

describe "pets story tests", type: :feature do
  before :each do

    @shelter_1 = Shelter.create(name: "Save Cats",
                              address: "123 Pine",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80112)

    @pet_1 = @shelter_1.pets.create(image: 'https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/09/dog-landing-hero-lg.jpg?bust=1536935129&width=1080',
                        name: "Jersey",
                        approximate_age: 10,
                        sex: "Male")

    @shelter_2 = Shelter.create(name: "Save Dogs",
                              address: "134 Pine",
                              city: "Littleton",
                              state: "Colorado",
                              zip: 80111)

    @pet_2 = @shelter_2.pets.create(image: 'https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg',
                        name: "Hershey",
                        approximate_age: 5,
                        sex: "Male")
  end

  describe "pets index page" do
    it "show all pets across shelters" do

      visit '/pets'

      expect(page).to have_css("img[src*='https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/09/dog-landing-hero-lg.jpg?bust=1536935129&width=1080']")
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.approximate_age)
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_content(@pet_1.shelter_id)

      expect(page).to have_css("img[src*='https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg']")
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_2.approximate_age)
      expect(page).to have_content(@pet_2.sex)
      expect(page).to have_content(@pet_2.shelter_id)
    end
  end

  describe "pets page tied to a shelter" do
    it "should show all the pets at the shelter with the pet info" do

      visit "/shelters/#{@shetler_1.id}/pets"
      find_link('View Pets').click
      expect(page).to have_current_path("/shelters/#{@shelter_1.id}/pets")

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.approximate_age)
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_content(@pet_1.shelter_id)
      page.should have_no_content(@pet_2.name)
      page.should have_no_content(@pet_2.approximate_age)
      page.should have_no_content(@pet_2.sex)
      page.should have_no_content(@pet_2.shelter_id)

      visit "/shelters/#{@shetler_2.id}/pets"
      find_link('View Pets').click
      expect(page).to have_current_path("/shelters/#{@shelter_2.id}/pets")

      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_2.approximate_age)
      expect(page).to have_content(@pet_2.sex)
      expect(page).to have_content(@pet_2.shelter_id)
      page.should have_no_content(@pet_1.name)
      page.should have_no_content(@pet_1.approximate_age)
      page.should have_no_content(@pet_1.sex)
      page.should have_no_content(@pet_1.shelter_id)

      find_link('Back to Shelter').visable?

    end
  end


end
