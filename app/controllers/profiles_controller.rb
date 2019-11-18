class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[edit show update destroy]
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:notice] = 'Successfully created!'
      redirect_to profile_path(@profile)
    else
      flash[:alert] = 'Something Went Wrong!'
      redirect_to new_profile_path
    end
  end

  def show
  end

  def edit
    if @profile.id != current_user.profile.id
      flash[:alert] = "You are not authorized to edit the profile......."
      redirect_to root_path
    end
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Changes Successfully Updated!'
      redirect_to profile_path(@profile)
    else
      flash[:alert] = 'Something Went Wrong!'
    end
  end

  def destroy
    @profile&.destroy
    flash[:notice] = 'Successfully deleted!'
    redirect_to root_path
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :username, :website, :bio, :phone_number, :avatar)
  end
end
