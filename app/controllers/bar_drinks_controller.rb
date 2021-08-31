class BarDrinksController < ApplicationController
  def index
    @bar = Bar.find(params[:id])
    @drinks = @bar.drinks
  end

  def new
    @bar = Bar.find(params[:id])
  end

  def create
    bar = Bar.find(params[:id])
    bar.drinks.create(drink_params)
    redirect_to "/bars/#{bar.id}/drinks"
  end

private
  def drink_params
    params.permit(:name, :drink_rating, :contains_alcohol)
  end
end
