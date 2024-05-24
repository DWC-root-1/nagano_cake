class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました。"
      redirect_to admin_item_path(@item)
    else
      flash.now[:alert] = "商品を登録できませんでした。"
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品情報を変更しました。"
      redirect_to admin_item_path(@item)
    else
      flash.now[:alert] = "商品情報を変更できませんでした。"
      render :edit
    end
  end

  # ストロングパラメータ
  private
  def item_params
    params.require(:item).permit(:genre_id, :item_image, :name, :introduction, :price, :is_active)
  end
end