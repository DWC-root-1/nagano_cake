class Item < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :item_image

  validates :genre, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def with_tax_price
    (price * 1.1).floor
  end

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height]).processed
  end

  def self.looks(search, word)
    if search == "partial"
      @item = Item.where("name LIKE?","%#{word}%")
    end
  end
end
