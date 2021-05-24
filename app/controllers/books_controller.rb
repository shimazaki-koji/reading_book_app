class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show]
  before_action :set_book2, only: [:destroy, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @books = Book.includes(:user).order("created_at DESC")
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
    params.require(:book).permit(:title, :learn, :contents).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_book2
    book = Book.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end