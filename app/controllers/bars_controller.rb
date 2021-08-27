class BarsController < ApplicationController
  def index
    @bars= Bar.order(created_at: :desc)
  end

  def show
    @bar = Bar.find(params[:id])
  end
end
