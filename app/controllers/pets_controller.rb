class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  # // CREATE
  # 
  def new
    # Afficher le formulaire à l'utilisateur
    @pet = Pet.new
  end
  
  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)  
    else
      render :new, status: :unprocessable_entity
    end
    # Enregistre dans la DB
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :address, :found_on, :species)
  end
end
