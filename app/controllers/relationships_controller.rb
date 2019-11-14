class RelationshipsController < ApplicationController
  def index 
    @active_relationships = current_user.active_relationships
    @passive_relationships = current_user.passive_relationships 
  end
  
  def create
    @followed_user = User.find(params[:relationships][:followed_id])
    @relationship = current_user.active_relationships.new(followed_id: @followed_user.id)
    if @relationship.save 
      flash[:notice] = "Follow Sucessful" 
      #redirect to profile path
    else  
      flash[:alert] = "Followed Unsucessful!"
      redirect_to root_path
    end
  end
  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.follower_user == current_user
      @relationship.destroy
        flash[:notice] = "Unfollowed!"
    end
    redirect_to root_path 
    #should correct it to profile path
  end
end
