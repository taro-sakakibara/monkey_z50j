require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'image, text, category_id,が存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'imageが空だと投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空だと投稿できない' do
        @tweet.category_id = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1だと投稿できない' do
        @tweet.category_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Category must be other than 1')
      end
      it 'textが空だと投稿できない' do
        @tweet.text = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが141文字以上だと投稿できない' do
        @tweet.text = SecureRandom.alphanumeric(141)
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Text is too long (maximum is 140 characters)')
      end
    end
  end
end
