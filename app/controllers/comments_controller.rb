# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_comment, only: [:create]

  def create
    comment = if @post
                @post.comments.build(comment_params.merge(post_id: @post.id, user_id: current_user.id))
              else
                @comment.comments.build(comment_params.merge(post_id: @comment.post_id, user_id: current_user.id))
              end
    if comment.save
      redirect_to post_path(comment.post)
    else
      flash[:alert] = 'Cannot create comment for the post'
      redirect_to post_path(comment.post_id)
    end
  end

  def destroy
    @comment&.destroy
    flash[:notice] = 'Successfully Deleted!'
    redirect_to post_path
  end

  private

  def set_post_comment
    @post = Post.find(params[:post_id]) if params[:post_id]
    @comment = Comment.find(params[:comment_id]) if params[:comment_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
