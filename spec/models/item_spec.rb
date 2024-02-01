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
  
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "価格に半角数字以外が含まれていると登録できないこと" do
          @item.price = "５００えん"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
       end

       it "価格が300円未満では登録できないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price must be greater than or equal to 300")
     end

     it "価格が9_999_999円を超えると登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price must be less than or equal to 9999999")
   end

   it 'userが紐付いていないと出品できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User must exist")
  end

      end
    end
  end
