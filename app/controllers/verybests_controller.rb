class VerybestsController < ApplicationController
  before_action :set_verybest, only: [:show, :edit, :update, :destroy]

  # GET /verybests
  def index
    @q = Verybest.ransack(params[:q])
    @verybests = @q.result(:distinct => true).includes(:dish, :venue, :user).page(params[:page]).per(10)
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
      message = 'Verybest was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @verybest, notice: message
      end
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
    message = "Verybest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to verybests_url, notice: message
    end
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
