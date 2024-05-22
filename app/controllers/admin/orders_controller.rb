class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  def update
   	@order = Order.find(params[:id])
   	@order.update(order_params)
    redirect_to request.referer
  end

  def update
   	@order = Order.find(params[:id])
    @order.update(order_params)
    order_detail = OrderDetail.where(order_id: params[:id])
    if params[:order][:status] == "confirm_payment"
      order_detail.update(making_status:"waiting_manufacture")
    end


    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :post_code, :address, :name, :shipping_cost, :total_payment, :status)
  end
end

