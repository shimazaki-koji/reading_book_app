class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_content, only: [:show, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @content = Content.new
    @book = Book.find(params[:book_id])
    @contents = @book.contents.includes(:book).order("created_at DESC")
  end

  def new
    @content = Content.new
  end

  def create
    @book = Book.find(params[:book_id])
    contents = @book.contents.new(content_params)
    if contents.save
      redirect_to book_contents_path(@book)
    else
      render :index
    end
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
    if content.update(content_params)
      redirect_to content_path
    else
      @content = Content.find(params[:id])
      render :edit
    end
  end

  def show
  end

  private

  def content_params
    params.permit(:chapter, :write_down, :wrap_up, :action_plan).merge(book_id: params[:book_id])
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @content.id
      redirect_to action: :index
    end
  end
end