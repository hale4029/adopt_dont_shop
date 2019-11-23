class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    shelter = Shelter.find(params[:shelter_id])
    @pets = shelter.pets.all
  end


end
