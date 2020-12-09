class Item < ApplicationRecord
  
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_category
  belongs_to :genre_condition
  belongs_to :genre_shipping_charge
  belongs_to :genre_shipping_area
  belongs_to :genre_days_to_ship


  with_options presence: true do
    validates :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price
  end

  validates :genre_category_id, :genre_condition_id, :genre_shipping_charge_id, :genre_shipping_area_id, :genre_days_to_ship_id, numericality: { other_than: 1 } 



end