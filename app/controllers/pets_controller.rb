class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  def show_pet
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create({
      name: params[:name],
      image: params[:image],
      description: params[:description],
      sex: params[:sex],
      approximate_age: params[:approximate_age]
      })
    pet.save
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end


end
