require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it '写真の添付が必須であること' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を添付してください')
      end

      it '商品名の入力が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品詳細の入力が必須であること' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end

      it 'カテゴリーの入力が必須であること' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end

      it '配送料の負担の入力が必須であること' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end

      it '発送までの日数の入力が必須であること' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end

      it '販売価格の入力が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
    end
  end
end
