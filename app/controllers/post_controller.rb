# frozen_string_literal: true

# :nodoc:
class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      flash[:sucess] = "Successfully created!"
      redirect_to root_path
    else
      flash[:error] = "Something Went wrong!"
      render 'new'
    end
  end

  def show; end

  def edit
    render 'edit'
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Successfully created!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Failed to Update!'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Successfully deleted!'
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  private 

  def post_params
    params.require(:post).permit(:image, :title)
  end
end
