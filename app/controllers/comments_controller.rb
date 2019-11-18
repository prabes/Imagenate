# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]


  def new
    comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = @post.user_id
    if @comment.save
      flash[:sucess] = 'Successfully created!'
      redirect_to post_path(@post)
    else
      flash[:notice] = 'Something Went wrong!'
      redirect_to post_path(@post)
    end
  end

  def show; end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Successfully updated!'
      redirect_to post_path
    else
      flash[:alert] = 'Failed to Update!'
    end
  end

  def destroy
    @comment&.destroy
    flash[:notice] = 'Successfully Deleted!'
    redirect_to post_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
