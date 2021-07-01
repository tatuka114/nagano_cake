class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_admin!, :except=>[:destroy]
  def index
    @items = Item.page(params[:page])
  end
  def show

  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
  	   redirect_to admin_item_path(@item)
  	else
  	  render :new
  	end
  end
  def edit

  end
  def update

  end
  private
  def item_params
    params.require(:item).permit(:genre_id,:name,:price,:is_active,:introduction,:image_id)
  end
end
