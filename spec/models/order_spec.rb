require 'rails_helper'

RSpec.describe Order, type: :model do
    before do
      @order = FactoryBot.build(:order)
    end
  
    describe '商品購入' do
  
      context "商品購入できるとき" do
        it "add_numberとcity、prefecture_idとhome_number、phone_numberが存在すれば登録できる" do
          expect(@order).to be_valid
        end
      end
  
      context '商品購入できないとき' do
        it 'add_numberが空では登録できない' do
          @order.add_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Add number can't be blank")
        end
        it 'cityが空では登録できない' do
          @order.city = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end
  
        it 'home_numberが空では登録できない' do
          @order.home_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Home number can't be blank")
        end
  
        it 'phone_numberが空では登録できない' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'prefecture_idがid:1では登録できない' do
          @order.prefecture_id = '1'
          @order.valid?
          expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
        end

       it 'add_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.add_number = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Add number is invalid. Include hyphen(-)')
      end

    end
  end
end