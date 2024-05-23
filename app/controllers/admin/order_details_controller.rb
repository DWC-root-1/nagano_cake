class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
   	@order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    order = @order_detail.order
    if params[:order_detail][:making_status] == "manufacturing"
      order.update(status:"making")
    end

    if is_all_order_details_making_completed(order)
      order.update(status:"preparing_ship")
    end
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

  def is_all_order_details_making_completed(order)
    order.order_details.each do |order_detail|
      if order_detail.making_status != 'finish'
        return false
      end
    end
    return true
  end

end
