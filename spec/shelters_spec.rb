require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "display all shelters" do
    shelter_1 = Shelter.create(name: "Denver")
    shelter_2 = Shelter.create(name: "Littleton")

    visit "/shelters"

    expect(page).to have_content(shelter_1)
    expect(page).to have_content(shelter_2)

  end
end
