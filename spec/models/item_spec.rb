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
          @item.category_id = '--'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
  
        it 'item_explainが空では登録できない' do
          @item.item_explain_id = '--'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explain is not a number")
        end
  
        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = '--'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number")
        end
  
          it 'postage_idが空では登録できない' do
          @item.postage_id = '--'
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage is not a number")
        end
  
        it 'take_idが空では登録できない' do
          @item.take_id = "--"
          @item.valid?
          expect(@item.errors.full_messages).to include("Take is not a number")
        end
  
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

      end
    end
  end
