class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(params[:id])
    else
      render :new
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.find(params[:genre_id])
  end

  def show
    @item = Item.find(params[:id])
    @order_detail = Order_detail.find(params[:order_detail_id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  # ストロングパラメータ
  private
  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
