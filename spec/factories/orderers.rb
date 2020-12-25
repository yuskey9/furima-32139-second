FactoryBot.define do
  factory :orderer do
    token                { 'tok_abcdefghijk00000000000000000' }
    postal_code          { '123-4567' }
    prefecture           { 2 }
    city                 { '名古屋市〇〇区' }
    addresses            { '番地2-1-2' }
    building             { '栄ビル' }
    phone_number         { '09012345678' }

    association :user
    association :item
  end
end
