# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    @relationship = Relationship.create(follower_id: params[:user_id], following_id: current_user.id)
    
    @request = Request.where(requesting_id: params[:user_id], requested_id: current_user.id)
    @request.destroy_all
    redirect_to root_path
  end

  def destroy
    @relationship = Relationship.where(follower_id: params[:user_id], following_id: current_user.id)
    @relationship&.destroy_all
    redirect_to root_path
  end
end
