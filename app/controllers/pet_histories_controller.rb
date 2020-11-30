class PetHistoriesController < ApplicationController
  before_action :set_pet_history, only: [:show, :edit, :update, :destroy]

  # GET /pet_histories
  # GET /pet_histories.json
  def index
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]
    @pet_histories = @pet.pet_histories
  end

  # GET /pet_histories/1
  # GET /pet_histories/1.json
  def show
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]
  end

  # GET /pet_histories/new
  def new
    @pet_history = PetHistory.new
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]
  end

  # GET /pet_histories/1/edit
  def edit
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]
  end

  # POST /pet_histories
  # POST /pet_histories.json
  def create
    @pet_history = PetHistory.new(pet_history_params)
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]

    @pet_history.pet = @pet

    respond_to do |format|
      if @pet_history.save
        format.html { redirect_to client_pet_pet_history_path(@client, @pet,@pet_history), notice: 'Pet history was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pet_histories/1
  # PATCH/PUT /pet_histories/1.json
  def update
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]
    respond_to do |format|
      if @pet_history.update(pet_history_params)
        format.html { redirect_to client_pet_pet_history_path(@client, @pet,@pet_history), notice: 'Pet history was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pet_histories/1
  # DELETE /pet_histories/1.json
  def destroy
    @client = Client.find_by params[:client_id]
    @pet = Pet.find_by params[:pet_id]
    @pet_history.destroy
    
    respond_to do |format|
      format.html { redirect_to client_pet_pet_histories_path(@client,@pet), notice: 'Pet history was successfully destroyed.' }
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_history
      @pet_history = PetHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_history_params
      params.require(:pet_history).permit(:weight, :heigth, :description, :date)
    end
end
