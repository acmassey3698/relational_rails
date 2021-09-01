class RestaurantMenuItemsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    @menu_items = @restaurant.menu_items
    
    if params[:ordered] == "alphabetical"
      @menu_items = @menu_items.order_alphabetically
    elsif params[:search]
      @menu_items = @menu_items.menu_items_by_calories(params[:search])
    end

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
