class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!

# URLにidを記載できないため、params[:id]ではなくcurrent_customerを使用
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to my_page_path
    else
     @customer = current_customer
     render 'edit'
    end
  end

  def destroy
  end


  def withdraw
   @customer = current_customer
   @customer.update(is_active: false)
   reset_session
   # flash[:notice] = "退会処理を実行しました"
   redirect_to root_path
  end

  def unsubscribe
   @customer = current_customer
  end

  private

  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :telephone_number)
  end

end
