class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Orderer.new
  end


  def create
    @order = Orderer.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end  
  end  

  private

  def order_params
    params.require(:orderer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end