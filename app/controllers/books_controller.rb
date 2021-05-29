class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :seach]

  def index
    @books = Book.includes(:user).order("created_at DESC")
  end

  def new
    @book = Book.new
  end

  def create
    #binding.pry
    Book.create(book_params)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.inclubes(:user)
  end

  def search
    @books = Book.search(params[:keyword])
  end
  
  private

  def book_params
    params.require(:book).permit(:id, :title, :learn, :genre, :image).merge(user_id: current_user.id)
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