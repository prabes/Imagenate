class RequestsController < ApplicationController
  def create
    @request = Request.create(requesting_id: current_user.id, requested_id: params[:user_id])
    if @request 
      flash[:success] = "Follow request Sent!"
    else
      flash[:alert] = "Sorry! Cannot Send Follow Request."
    end
  redirect_to root_path
  end
  
  def destroy
    @request = Request.where(requesting_id: current_user.id, requested_id: params[:user_id])
    @request.destroy_all
    redirect_to root_path
  end
end
