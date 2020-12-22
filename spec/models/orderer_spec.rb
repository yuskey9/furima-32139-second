require 'rails_helper'

RSpec.describe Orderer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @orderer = FactoryBot.build(:orderer, user_id: @user.id, item_id: @item.id)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it '配送先の郵便番号,都道府県,市区町村,番地,電話番号が存在すれば購入できる' do
        expect(@orderer).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it '配送先の郵便番号が空では購入できない' do
        @orderer.postal_code = ''
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Postal code can't be blank")
      end

      it '配送先の郵便番号にハイフンが無いと購入できない' do
        @orderer.postal_code = '1234567'
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Postal code is invalid")
      end

      it '配送先の郵便番号が７桁以外では購入できない' do
        @orderer.postal_code = '123-45678'
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include()
      end  


      it '配送先の都道府県は空であるプルダウンの１つ目を選択しては購入できない' do
        @orderer.prefecture_id = 1
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '配送先の市区町村が空では購入できない' do
        @orderer.city = ''
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の番地が空では登録できない' do
        @orderer.addresses = ''
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Addresses can't be blank")
      end

      it '配送先の電話番号が空では購入できない' do
        @orderer.phone_number = ''
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it '配送先の電話番号にハイフンがあると購入できない' do
        @orderer.phone_number = '090-1234-5678'
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '配送先の電話番号が10桁、もしくは11桁以外では購入できない' do
        @orderer.phone_number = '090123456789'
        @orderer.valid?
        expect(@orderer.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end