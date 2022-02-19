class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result(distinct: true).includes(:verybests).page(params[:page]).per(10)
  end

  def show
    @verybest = Verybest.new
  end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to @dish, notice: "Dish was successfully created."
    else
      render :new
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to @dish, notice: "Dish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_url, notice: "Dish was successfully destroyed."
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :category)
  end
end
