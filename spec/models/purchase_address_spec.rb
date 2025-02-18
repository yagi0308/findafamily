require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '注文の保存' do
    context '正常系' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名がなくても登録できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が空では保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号を入力してください')
      end

      it '都道府県が空では保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県を入力してください')
      end

      it '市区町村が空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('市区町村を入力してください')
      end

      it '番地が空では保存できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('番地を入力してください')
      end

      it '電話番号が空では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号を入力してください')
      end

      it '郵便番号にハイフンが無ければ登録できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '電話番号に半角数字以外が含まれていると購入できない' do
        @purchase_address.home_phone_number = '123-4567-890a'
        @purchase_address.valid?
      end

      it '電話番号が9桁以下なら購入できない' do
        @purchase_address.home_phone_number = '123456789'
        @purchase_address.valid?
      end

      it '電話番号が12桁以上なら購入できない' do
        @purchase_address.home_phone_number = '123456789012'
        @purchase_address.valid?
      end

      it 'tokenが空なら購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
      end

      it 'user_idが空だと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idとitem_idが両方空だと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank", "Item can't be blank")
      end
    end
  end
end
