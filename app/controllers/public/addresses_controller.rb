class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配達先を登録しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses.all
      flash.now[:alert] = "配達先を登録できませんでした。"
      render 'index'
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配達先を変更しました。"
      redirect_to addresses_path(@address.id)
    else
      flash.now[:alert] = "配達先を変更できませんでした。"
      render 'edit'
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.customer_id = current_customer.id
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
