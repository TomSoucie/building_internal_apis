class Api::V1::OrdersController < ApplicationController
  def index
    # render json: Order.all
    @orders = Order.all
  end

  def show
    # render json: Order.find(params[:id])
    @order = Order.find(params[:id])
  end
end
