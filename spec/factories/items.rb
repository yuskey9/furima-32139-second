FactoryBot.define do
  factory :item do
    name                    { '佐藤' }
    info                    { '説明文' }
    category_id             { 2 }
    sales_status_id         { 3 }
    shipping_fee_status_id  { 4 }
    prefecture_id           { 5 }
    scheduled_delivery_id   { 6 }
    price                   { 700 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
