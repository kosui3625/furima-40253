class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new]
  before_action :authenticate_user!, except: [:index,]
  before_action :move_to_index, except: [:index, :new]

  def index


  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: inprocessable_entity
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def move_to_new
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end

end
