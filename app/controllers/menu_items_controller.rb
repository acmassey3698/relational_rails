class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    menu_item = MenuItem.find(params[:id])
    menu_item.update(menu_item_params)
    redirect_to "/menu_items/#{menu_item.id}"
  end

private
  def menu_item_params
    params.permit(:name, :calories, :vegetarian)
  end
end
