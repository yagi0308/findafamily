require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'passwordが半角英数字混合でない場合は登録できない（英字のみ）' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordが半角英数字混合でない場合は登録できない（数字のみ）' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = 'ａｂｃ１２３'
        @user.password_confirmation = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'お名前(全角)の名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)を入力してください')
      end

      it 'お名前(全角)の名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)を入力してください')
      end

      it 'お名前(全角)の名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'Test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)は不正な値です')
      end

      it 'お名前(全角)の名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)は不正な値です')
      end

      it 'お名前カナ(全角)の名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)を入力してください')
      end

      it 'お名前カナ(全角)の名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)を入力してください')
      end

      it 'お名前カナ(全角)の名字が全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)は全角カタカナで入力してください')
      end

      it 'お名前カナ(全角)の名前が全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)は全角カタカナで入力してください')
      end

      it '電話番号が空では保存できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号を入力してください')
      end

      it '電話番号に半角数字以外が含まれていると登録できない' do
        @user.phone_number = '123-4567-890a'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号が9桁以下なら登録できない' do
        @user.phone_number = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号が12桁以上なら登録できない' do
        @user.phone_number = '123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'お住まいの地域が空では登録できない' do
        @user.region_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('お住まいの地域を入力してください')
      end

      it '生年月日が空でも登録できる' do
        @user.birthdate = nil
        expect(@user).to be_valid
      end

      it 'プロフィール画像が空でも登録できる' do
        @user.profile_image = nil
        expect(@user).to be_valid
      end

      it '自己紹介が空でも登録できる' do
        @user.introduction = nil
        expect(@user).to be_valid
      end
    end
  end
end
