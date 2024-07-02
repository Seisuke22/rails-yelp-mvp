class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    raise
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_param)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def restaurant_param
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
