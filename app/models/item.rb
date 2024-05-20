class Item < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :item_image

end
