require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録ができるとき' do
      it 'ユーザーに関する情報がすべて存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end
  end
end
 
