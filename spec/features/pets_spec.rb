require 'rails_helper'

describe "pets story tests", type: :feature do
  before :each do
    @pet_1 = Pet.create(image: 'https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/09/dog-landing-hero-lg.jpg?bust=1536935129&width=1080',
                        name: "Jersey",
                        approximate_age: 10,
                        sex: "Male")
    @shelter_1 = Shelter.create(name: "Save Cats",
                              address: "123 Pine",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80112)

    @shelter_1 << @pet_1

    @pet_2 = Pet.create(image: 'https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg',
                        name: "Hershey",
                        approximate_age: 5,
                        sex: "Male")

    @shelter_2 = Shelter.create(name: "Save Dogs",
                              address: "134 Pine",
                              city: "Littleton",
                              state: "Colorado",
                              zip: 80111)

    @shelter_2 << @pet_2
  end

  describe "pets index page" do
    it "show all pets across shelters" do

      visit '/pets'

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_2.name)
    end
  end

end
