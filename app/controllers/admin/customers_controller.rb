class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました。"
      redirect_to admin_customer_path(customer)
    else
      @customer = Customer.find(params[:id])
      flash.now[:alert] = "会員情報を変更できませんでした。"
      render 'edit'
    end
  end

  private

  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :telephone_number, :is_active)
  end

end
