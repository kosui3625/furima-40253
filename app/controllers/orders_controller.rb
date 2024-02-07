class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index ]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:add_number, :prefecture, :city, :home_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end



end
