class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    redirect_to root_path if @item.order.present? || current_user.id == @item.user.id
    @order = Orderer.new
  end

  def create
    @order = Orderer.new(order_params)
    if @order.valid?
      card
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orderer).permit(:token, :postal_code, :prefecture, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end    
end
