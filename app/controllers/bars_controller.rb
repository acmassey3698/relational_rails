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

  def edit
    @bar = Bar.find(params[:id])

  end

  def update
    bar = Bar.find(params[:id])
    bar.update(bar_params)
    redirect_to "/bars/#{bar.id}"
  end

private
  def bar_params
    params.permit(:name, :tabs, :has_food)
  end
end
