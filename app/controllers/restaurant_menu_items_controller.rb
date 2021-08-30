class RestaurantMenuItemsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
  end

  def new

  end
end
