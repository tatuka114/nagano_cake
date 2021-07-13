class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :update]
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
		@order_details = order.order_details
    @order.update(order_params)

  end
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
