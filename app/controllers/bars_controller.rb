class BarsController < ApplicationController
  def new
  end

  def index
    @bars= Bar.order(created_at: :desc)
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def create
    bar = Bar.create(bar_params)

    redirect_to "/bars"
  end

  def bar_params
    params.permit(:name, :tabs, :has_food)
  end

  def edit
    require "pry"; binding.pry
    @bar = Bar.find(params[:id])
  end
end
