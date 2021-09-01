class DrinksController < ApplicationController
  def index
    @drinks = Drink.get_alcoholic_drinks
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    drink = Drink.find(params[:id])
    drink.update(drink_params)
    redirect_to "/drinks/#{drink.id}"
  end

  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    redirect_to "/drinks"
  end

private
  def drink_params
    params.permit(:name, :drink_rating, :contains_alcohol)
  end
end
