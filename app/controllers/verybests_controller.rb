class VerybestsController < ApplicationController
  before_action :set_verybest, only: %i[show edit update destroy]

  def index
    @q = Verybest.ransack(params[:q])
    @verybests = @q.result(distinct: true).includes(:dish, :venue,
                                                    :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @verybest = Verybest.new
  end

  def edit; end

  def create
    @verybest = Verybest.new(verybest_params)

    if @verybest.save
      message = "Verybest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @verybest, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @verybest.update(verybest_params)
      redirect_to @verybest, notice: "Verybest was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @verybest.destroy
    message = "Verybest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to verybests_url, notice: message
    end
  end

  private

  def set_verybest
    @verybest = Verybest.find(params[:id])
  end

  def verybest_params
    params.require(:verybest).permit(:dish_id, :venue_id, :user_id, :notes,
                                     :timestamp)
  end
end
