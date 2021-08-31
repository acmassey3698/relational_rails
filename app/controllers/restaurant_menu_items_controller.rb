class RestaurantMenuItemsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    restaurant = Restaurant.find(params[:id])
    restaurant.menu_items.create(menu_items_params)
    redirect_to "/restaurants/#{restaurant.id}/menu_items"
  end

private
  def menu_items_params
    params.permit(:name, :calories, :vegetarian)
  end
end
