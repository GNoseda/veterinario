class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @client = Client.find params[:client_id]
    @pets = @client.pets
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @client = Client.find params[:client_id]
  end

  # GET /pets/new
  def new
    @client = Client.find params[:client_id]
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @client = Client.find params[:client_id]
  end

  # POST /pets
  # POST /pets.json
  def create
    @client = Client.find_by params[:client_id]
    @pet = Pet.new(pet_params)

    @pet.client = @client

    respond_to do |format|
      if @pet.save
        format.html { redirect_to client_pet_path(@client, @pet), notice: 'Pet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    @client = Client.find params[:client_id]
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to client_pet_path(@client,@pet), notice: 'Pet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @client = Client.find params[:client_id]
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to client_pets_path(@client), notice: 'Pet was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :race, :birthdate)
    end
end
