class ItemsController < ApplicationController
  #before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]


  def index

    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    #if current_user.update(user_params)
      #redirect_to root_path
    #else
      #render :edit, status: :unprocessable_entity
    #end
  end
  

  private

  def item_params
    params.require(:item).permit(:name, :price, :comment, :category_id, :item_explain_id, :prefecture_id,:postage_id, :take_id, :image).merge(user_id: current_user.id)
  end



  #def set_item
    #@item = Item.find(params[:id])
  #end

end
