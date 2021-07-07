class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!, :except => [:destroy]
  def index
    @items = Item.page(params[:page]).per(10)
  end
  def show
    @item = Item.find(params[:id])
  end
  def new
    @item = Item.new
    @genres = Genre.all
  end
  def create
    @item = Item.new(item_params)
    if @item.save
  	  redirect_to admin_items_path(@item)
    else
      render "new"
    end
  end
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  	redirect_to admin_items_path(@item)

  end
  private
  def item_params
    params.require(:item).permit(:genre_id,:name,:price,:is_active,:introduction,:image)
  end
end
