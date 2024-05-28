class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  validates :customer_id, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}
end
