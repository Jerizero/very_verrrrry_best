class VerybestsController < ApplicationController
  before_action :set_verybest, only: [:show, :edit, :update, :destroy]

  # GET /verybests
  def index
    @verybests = Verybest.all
  end

  # GET /verybests/1
  def show
  end

  # GET /verybests/new
  def new
    @verybest = Verybest.new
  end

  # GET /verybests/1/edit
  def edit
  end

  # POST /verybests
  def create
    @verybest = Verybest.new(verybest_params)

    if @verybest.save
      redirect_to @verybest, notice: 'Verybest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /verybests/1
  def update
    if @verybest.update(verybest_params)
      redirect_to @verybest, notice: 'Verybest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /verybests/1
  def destroy
    @verybest.destroy
    redirect_to verybests_url, notice: 'Verybest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verybest
      @verybest = Verybest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def verybest_params
      params.require(:verybest).permit(:dish_id, :venue_id, :user_id, :notes, :timestamp)
    end
end
