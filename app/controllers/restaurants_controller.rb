class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order(:created_at)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_menu_items
    @restaurant = Restaurant.find(params[:id])
  end
end
