class DrinksController < ApplicationController
  def index

    @drinks = Drink.get_alcoholic_drinks

  end

  def show
    @drink = Drink.find(params[:id])
  end
end
