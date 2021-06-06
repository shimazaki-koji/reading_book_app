class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_book, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :seach]

  def index
    @books = Book.includes(:user).order("created_at DESC")
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    if book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def show
  end

  def search
    @books = Book.search(params[:keyword])
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :writer, :learn, :genre, :image).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end