class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_menu_items
    @restaurant = Restaurant.find(params[:id])
  end
end
