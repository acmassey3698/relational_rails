class RestaurantsController < ApplicationController
  def new
  end

  def create
    params_hash = {
      name: params[:name],
      yelp_rating: params[:yelp_rating],
      delivery: params[:delivery]
      }

    restaurant = Restaurant.new(params_hash)

    restaurant.save

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
end
