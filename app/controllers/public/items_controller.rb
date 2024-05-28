class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @item_count = Item.all.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
