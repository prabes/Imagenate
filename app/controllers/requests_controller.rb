# frozen_string_literal: true

class RequestsController < ApplicationController #:nodoc:
  before_action :request_params

  def create
    @request =
      Request.create(requesting_id: current_user.id,
                     requested_id: params[:user_id])
    if @request
      flash[:success] = 'Follow request Sent!'
    else
      flash[:alert] = 'Sorry! Cannot Send Follow Request.'
    end
    render :cancel
  end

  def destroy
    if request_params[:status] == 'canceled'
      destroy_request(current_user.id, request_params[:user_id])
      render :cancel
    elsif request_params[:status] == 'declined'
      destroy_request(request_params[:user_id], current_user.id)
      render :decline
    end
  end

  private

  def request_params
    params.permit(:user_id, :status, :authenticity_token)
  end

  def destroy_request(requesting_id, requested_id)
    @request =
      Request.where(requesting_id: requesting_id,
                    requested_id: requested_id)
    @request.destroy_all
  end
end
