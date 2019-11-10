# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    comment = Comment.all
  end

  def new
    comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @post =
      if comment.save
        flash[:sucess] = 'Successfully created!'
        redirect_to root_path
      else
        flash[:notice] = 'Something Went wrong!'
        render 'new'
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
    permit.require(:comment).permit(:body)
  end
end
