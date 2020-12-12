require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # Itemのインスタンス生成(before使用時はインスタンス変数で@がつく)
  end

  describe '商品の出品' do
    context '商品の出品がうまくいくとき' do
      it 'image,name,info,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_id,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it '商品画像を１枚もつけていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品名の説明が空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it '商品のカテゴリー情報が空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it '商品のカテゴリー情報は空であるプルダウンの１つ目を選択しては出品ができない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が空では出品できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", 'Sales status is not a number')
      end

      it '商品の状態についての情報は、空であるプルダウンの１つ目を選択しては出品ができない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end      

      it '商品の配送料の負担についての情報が空では出品できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", 'Shipping fee status is not a number')
      end

      it '商品の配送料の負担についての情報は、空であるプルダウンの１つ目を選択しては出品ができない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end            

      it '商品の発送元の地域についての情報が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it '商品の配送料の負担についての情報は、空であるプルダウンの１つ目を選択しては出品ができない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end                 

      it '商品の発送までの日数についての情報が空では出品できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", 'Scheduled delivery is not a number')
      end

      it '商品の発送までの日数についての情報は、空であるプルダウンの１つ目を選択しては出品ができない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end                
      
      it '商品の価格についての情報が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price Price is not a number')
      end
      
      it '商品の価格が299円以下では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      
      it '商品の価格が10,000,000円以上では出品できない' do
        @item.price = 10000100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 10000000")
      end

      it '商品の販売価格は全角数字では保存も出品もできない' do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end        
    end
  end
end
