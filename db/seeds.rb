
shelter_1 = Shelter.create(name: "Save Cats",
                          address: "123 Pine",
                          city: "Denver",
                          state: "Colorado",
                          zip: 80112)

shelter_2 = Shelter.create(name: "Save Dogs",
                          address: "134 Pine",
                          city: "Littleton",
                          state: "Colorado",
                          zip: 80111)

pet_1 = Pet.create(image: 'https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/09/dog-landing-hero-lg.jpg?bust=1536935129&width=1080',
                                              name: "Jersey",
                                              approximate_age: 10,
                                              sex: "Male")

shelter_1 << pet_1
