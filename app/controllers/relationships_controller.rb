class RelationshipsController < ApplicationController
  
  def create
    @relationship = Relationship.create(follower_id: current_user.id, following_id: params[:user_id])
    if @relationship 
      redirect_to root_path
    else 
      flash[:alert] = "Cannot Follow!"
      redirect_to root_path
    end
  end
  def destroy
    @relationship = Relationship.where(follower_id: current_user.id, following_id: params[:user_id])
    @relationship.destroy_all if @relationship
    redirect_to root_path
  end
end
