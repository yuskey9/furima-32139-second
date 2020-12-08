FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 10, max_length: 20) }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '優介' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'ユウスケ' }
    birth_date            { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
