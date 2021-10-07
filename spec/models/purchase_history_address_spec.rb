require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 1
      @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_history_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_history_address.building_name = ''
        expect(@purchase_history_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_history_address.postal_code = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_history_address.postal_code = '1234567'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_history_address.prefecture_id = 1
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_history_address.city = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_history_address.address = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_history_address.phone_number = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角の数字だと保存できないこと' do
        @purchase_history_address.phone_number = '０９０１２３４５６７８'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにハイフンが含まれていると保存できないこと' do
        @purchase_history_address.phone_number = '090-1234-5678'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @purchase_history_address.phone_number = '090123456'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @purchase_history_address.phone_number = '090123456789'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと保存できないこと' do
        @purchase_history_address.user_id = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase_history_address.item_id = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと登録できないこと' do
        @purchase_history_address.token = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
