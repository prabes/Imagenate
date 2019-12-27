# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post

  def create
    if !already_liked?
      flash[:notice] = "You can't a like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to root_path
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      redirect_to root_path
    else 
      flash[:alert] = "Sorry! Cannot Unlike the Post."
    end
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).empty?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
