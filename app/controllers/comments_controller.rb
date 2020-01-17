# frozen_string_literal: true

# CommnetsContoller with methods to create and destroy comments
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_comment
  before_action :comment_params, only: [:comment_build]

  def create
    comment = check_commentable
    flash[:alert] = 'Cannot create comment for the post' unless comment.save
    redirect_to post_path(comment.post_id)
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

  def check_commentable
    if @post
      comment_build(@post, @post.id)
    else
      comment_build(@comment, @comment.post_id)
    end
  end

  def comment_build(commentable_type, post_id)
    commentable_type.comments.build(comment_params
                    .merge(post_id: post_id, user_id: current_user.id))
  end
end
