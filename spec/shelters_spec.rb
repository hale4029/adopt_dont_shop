require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all the shelters" do
    shelter_1 = Shelter.create()
    shelter_2 = Shelter.create()

    visit "/shelters"

    expect(page).to have_content(shelter_1)
    expect(page).to have_content(shelter_2)
    
  end
end
