class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items.all
      render 'index'
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      render 'index'
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
    redirect_to request.referer
    else
      render 'index'
    end
  end

  def destroy_all
    if current_customer.cart_items.destroy_all
    redirect_to request.referer
    else
      render 'index'
    end
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :price, :amount)
    end

end
