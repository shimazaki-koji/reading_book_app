class CommentsController < ApplicationController

  def create
    @commnet = Comment.create(comment_params)
    if @comment.save
      redirect_to book_content_path(content.book_id, content.id)
    else
      @book = @comment.book
      @comments = @book.comments
      render "books/[book.id]/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, content_id: params[:content_id])
  end
end