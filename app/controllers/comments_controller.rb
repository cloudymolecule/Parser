class CommentsController < ApplicationController
  def index
    @log = Log.find(comment_params[:log_id])
    @comments = @log.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(log_id: comment_params[:log_id] )
  end

  def create
    @log = Log.find(comment_params[:log_id])
    @comment = Comment.create(comment_params)
    redirect_to comments_path(:comment => {log_id: @log.id})
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comments_path(:comment => {log_id: @comment.log_id})
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comments_path(:comment => {log_id: comment.log_id})
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :log_id, :text)
  end

end
