# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    @relationship = Relationship.create(follower_id: current_user.id, following_id: params[:user_id])
    flash[:alert] = 'Cannot Follow!' unless @relationship
    redirect_to root_path
  end

  def destroy
    @relationship = Relationship.where(follower_id: current_user.id, following_id: params[:user_id])
    @relationship&.destroy_all
    redirect_to root_path
  end
end
