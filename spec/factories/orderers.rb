FactoryBot.define do
  factory :orderer do
    postal_code          {"123-4567"}
    prefecture_id        { 2 }
    city                 { "名古屋市〇〇区" }
    addresses            { "番地2-1-2" }
    phone_number         {"09012345678"}

    association :user
    association :item
  end
end