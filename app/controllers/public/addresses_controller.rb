class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.id = current_customer.id
    if  @address.save
    puts "ここがエラー"
      redirect_to addresses_path
    else
      @addresses = Address.all
      redirect_to addresses_path
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path(address.id)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path(address.id)
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
