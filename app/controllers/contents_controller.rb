class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :index]
  before_action :set_content, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @contents = Content.includes(:user).order("created_at DESC")
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
  end

  def edit
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
  end

  def show
    #@comment = Comment.new
    #@comments = @content.comments.includes(:user)
  end

  private

  def content_params
    params.require(:content).permit(:write_down, :wrap_up, :action_plan).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def set_content
    @content = Content.find(params[:book_id])
  end

  def move_to_index
    if current_user == @book.user
      redirect_to root_path
    end
  end
end