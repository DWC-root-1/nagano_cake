class Address < ApplicationRecord
  belongs_to :customer

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def address_display
    '〒' + post_code + ' ' + address + '　' + name
  end

end
