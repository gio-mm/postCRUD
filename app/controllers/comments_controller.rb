class CommentsController < ApplicationController

  def show
    @comment=Comment.find(params[:id])
    @post=@comment.post

  end

  def create
    @comment=Comment.new(params.require(:comments).permit(:post_id,:body))
    @comment.save
    redirect_to @comment.post
  end
  def edit
    @comment=Comment.find(params[:id])

  end
  def update

    @comment=Comment.find(params[:id])
    @comment.update(params.require(:comment).permit(:body))

    flash[:notice] = "comment was updated successfully"
    redirect_to @comment
  end
  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post
  end

end

