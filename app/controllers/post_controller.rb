class PostController < ApplicationController
  before_action :authenticate_user!

  
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

  def index
    @posts = Post.order('created_at') 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def post_params
    params.require(:post).permit(:image, :title)
  end
end
