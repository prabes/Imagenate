class LikesController < ApplicationController
  before_action :find_post
  
  def create
    if !(already_liked?)
      flash[:notice] = "You can't a like more than once"
      redirect_to root_path
    else
      @post.likes.create(user_id: current_user.id)
      redirect_to post_path(@post) 
    end
  end

  def destroy
    like = @post.likes.find_by(user_id: current_user.id)
    like.destroy  if like 
    redirect_to post_path(@post)
  end

  private 
  def already_liked?   
    Like.where(user_id: current_user.id, post_id: params[:post_id]).empty?
  end
  
  def find_post
    @post = Post.find(params[:post_id])
  end
end
