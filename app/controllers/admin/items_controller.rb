class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.page(params[:page])
  end
  def show

  end
  def new

  end
  def create

  end
  def edit

  end
  def update

  end
  private
  def item_params

  end
end
