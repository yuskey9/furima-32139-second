class Item < ApplicationRecord

  with_options presence: true do
    validates :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price
  end
  
  belongs_to :user
  has_one :order
end