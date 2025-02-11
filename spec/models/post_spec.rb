require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@post).to be_valid
      end
    end

    context '異常系' do
      it '写真の添付が必須であること' do
        @post.animal_image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('写真を添付してください')
      end

      it 'タイトルの入力が必須であること' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'カテゴリーの入力が必須であること' do
        @post.category_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('カテゴリーを入力してください')
      end

      it '種類の入力が必須であること' do
        @post.animal_type = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('種類を入力してください')
      end

      it '性別の入力が必須であること' do
        @post.gender_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('性別を入力してください')
      end

      it '性格の入力が必須であること' do
        @post.personality = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('性格を入力してください')
      end

      it '保護や譲渡の場所の入力が必須であること' do
        @post.address = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('保護や譲渡の場所を入力してください')
      end

      it 'その他の詳細の入力が必須であること' do
        @post.description = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('その他の詳細を入力してください')
      end

      it '年齢が空でも登録できる' do
        @post.age = nil
        expect(@post).to be_valid
      end
    end
  end
end
