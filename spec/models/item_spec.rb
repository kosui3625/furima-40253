require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品登録' do
  
      context "商品登録できるとき" do
        it "nameとprice、commentとcategory_id、item_explain_idとprefecture_id、postage_idとtake_id、imageが存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end
  
      context '商品登録できないとき' do
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'commentが空では登録できない' do
          @item.comment = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Comment can't be blank")
        end
  
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
  
        it 'cattegory_idが空では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
  
        it 'item_explainがid:1では登録できない' do
          @item.item_explain_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explain must be other than 1")
        end
  
        it 'prefecture_idがid:1では登録できない' do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
  
          it 'postage_idがid:1では登録できない' do
          @item.postage_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage must be other than 1")
        end
  
        it 'take_idがid:1ではできない' do
          @item.take_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Take must be other than 1")
        end
  
        it 'imageがid:1では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

      end
    end
  end
