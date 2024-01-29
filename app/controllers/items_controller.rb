class ItemsController < ApplicationController
  #before_action :set_prototype, except: [:index, :new]
  #before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def items
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end


end
