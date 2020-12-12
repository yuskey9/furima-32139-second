class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price
  end

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10_000_000 }

  validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: 'Price is not a number' }
end
