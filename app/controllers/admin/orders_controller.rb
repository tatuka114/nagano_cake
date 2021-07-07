class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :update]
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
  end
  def update

  end
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
