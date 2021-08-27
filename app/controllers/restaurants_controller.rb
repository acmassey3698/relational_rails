class RestaurantsController < ApplicationController
  def new
  end

  def create
    restaurant = Restaurant.create(restaurant_params)

    redirect_to "/restaurants"
  end



  def index
    @restaurants = Restaurant.all.order(:created_at)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_menu_items
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.permit(:name, :yelp_rating, :delivery)
  end
end
