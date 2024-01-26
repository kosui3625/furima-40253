require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    describe "新規登録できるとき" do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_hiraganaが空では登録できない' do
        @user.family_name_hiragana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name hiragana can't be blank")
      end

      it 'first_name_hiraganaが空では登録できない' do
        @user.first_name_hiragana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hiragana can't be blank")
      end

        it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test456'
        @user.password_confirmation = 'test123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '生年月日が空では登録できない' do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end

     it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.password = 'password1234'
      another_user.password_confirmation = 'password1234'
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
       @user.password = '00000'
       @user.password_confirmation = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "英字のみのパスワードでは登録できないこと" do
        @user = FactoryBot.build(:user, password: "password", password_confirmation: "password")
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "数字のみのパスワードでは登録できないこと" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "全角を含むパスワードでは登録できないこと" do
        @user.password = "Ｔester01"
        @user.password_confirmation = "Ｔester01"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "姓（全角）に半角文字が含まれていると登録できないこと" do
         @user.family_name = "Tanaka"
         @user.valid?
         expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "名（全角）に半角文字が含まれていると登録できないこと" do
        @user.first_name = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "カタカナ以外の文字が含まれている姓（カナ）では登録できないこと" do
        @user.family_name_hiragana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name hiragana is invalid")
      end

      it "カタカナ以外の文字が含まれている名前（カナ）では登録できないこと" do
        @user.first_name_hiragana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hiragana is invalid")
      end
    end
  end
end

