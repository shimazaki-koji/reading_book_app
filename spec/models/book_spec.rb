require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本の登録機能' do
    context '登録できるとき' do
      it '必要な情報が入力されているとき' do
        expect(@book).to be_valid
      end
    end

    context '登録できないとき' do
      it '本のtitleが空欄のとき' do
        @book.title = ""
        @book.valid?
        expect(@book.errors.full_messages).to include("Title can't be blank")
      end

      it '本から学びたいこと(learn)が空欄のとき' do
        @book.learn = ""
        @book.valid?
        expect(@book.errors.full_messages).to include("Learn can't be blank")
      end

      it '本のジャンル(genre)が空欄のとき' do
        @book.genre = ""
        @book.valid?
        expect(@book.errors.full_messages).to include("Genre can't be blank")
      end
    end
  end
end