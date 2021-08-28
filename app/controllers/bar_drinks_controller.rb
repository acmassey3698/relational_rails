class BarDrinksController < ApplicationController
  def index
    @bar = Bar.find(params[:bar_id])
    @drinks = @bar.drinks
  end
end
