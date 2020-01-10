# frozen_string_literal: true

class RelationshipsController < ApplicationController #:nodoc:
  def create
    @relationship =
      Relationship.create(follower_id: params[:user_id],
                          following_id: current_user.id)
    @request =
      Request.where(requesting_id: params[:user_id],
                    requested_id: current_user.id)
    @request.destroy_all
    redirect_to root_path
  end

  def destroy
    @relationship =
      Relationship.where(follower_id: current_user.id,
                         following_id: params[:user_id])
    @relationship&.destroy_all
    render 'requests/cancel'
  end
end
