class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show]
  before_action :set_book2, only: [:destroy, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
  end

  def destroy
    book.destroy
  end

  def edit
  end

  def update
    book.update(book_params)
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :learn, :contents)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_book2
    book = Book.find(params[:id])
  end
end