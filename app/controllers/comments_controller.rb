class CommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    #Comment.find(params[:book_id]).destroy
    book = Book.find(params[:book_id])
    comment = current_user.comment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
