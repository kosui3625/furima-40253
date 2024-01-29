class ItemsController < ApplicationController
  #before_action :set_prototype, except: [:index, :new]
  #before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
  end

  private

  def item_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end

end
