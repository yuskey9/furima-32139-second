class Orderer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

     
  def save
    user = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, user_id: user.id)
  end
end