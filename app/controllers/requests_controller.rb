# frozen_string_literal: true

class RequestsController < ApplicationController #:nodoc:
  def create
    @request =
      Request.create(requesting_id: current_user.id,
                     requested_id: params[:user_id])
    if @request
      flash[:success] = 'Follow request Sent!'
    else
      flash[:alert] = 'Sorry! Cannot Send Follow Request.'
    end
    render :create
  end

  def destroy
    @request =
      Request.where(requesting_id: current_user.id,
                    requested_id: params[:user_id])
    @request.destroy_all
    render :create
  end
end
