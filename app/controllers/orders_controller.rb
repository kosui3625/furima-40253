class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  before_action :check_order, only: [:index]



  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:add_number, :prefecture_id, :city, :home_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.nil? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def check_order
    set_item
    if @item.pay.present?
      redirect_to root_path
    end
  end



end
