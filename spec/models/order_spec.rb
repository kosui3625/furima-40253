require 'rails_helper'

RSpec.describe Order, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end
  
    describe '商品購入' do
  
      context "商品購入できるとき" do
        it "add_numberとcity、prefecture_idとhome_number、phone_numberが存在すれば登録できる" do
          expect(@order).to be_valid
        end
      end

      context '内容に問題ない場合' do
        it 'building_nameは空でも保存できること' do
          @order.building_name = ''
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

          it 'phone_numberが10桁以下では登録できない' do
            @order.phone_number = '123456789' 
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number must be 10 or 11 digits")
          end
      
          it 'phone_numberが11桁以上では登録できない' do
            @order.phone_number = '123456789012' 
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number must be 10 or 11 digits")
          end

          it 'phone_numberが英数字以外が含まれている場合は登録できない' do
            @order.phone_number = '1234567890a' # includes non-numeric characters
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number is not a number")
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

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
