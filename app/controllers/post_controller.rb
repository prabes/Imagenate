# frozen_string_literal: true

class PostController < ApplicationController #:nodoc:
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post =
      Post.new(title: post_params[:title],
               description: post_params[:description])
    @post.user = current_user
    save_post(@post)
  end

  def show; end

  def edit
    render 'edit'
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Successfully updated!'
      render post_path(@post)
    else
      flash[:alert] = 'Failed to Update!'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Successfully deleted!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, image: [])
  end

  def save_post(post)
    if post.save
      save_image post
      flash[:sucess] = 'Successfully created`!'
      redirect_to root_path
    else
      flash[:notice] = 'Something Went wrong!'
      render 'new'
    end
  end

  def save_image(post)
    post_params[:image].each do |img|
      post.images.create(image: img)
    end
  end
end
