# frozen_string_literal: true

class ProfilesController < ApplicationController #:nodoc:
  before_action :authenticate_user!
  before_action :set_profile, only: %i[edit update destroy]
  before_action :profile_params, only: %i[create update]
  before_action :image_params, only: %i[create update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save &&
       @profile.image.build(image_params).save
      flash[:notice] = 'Successfully created!'
    else
      flash[:alert] = 'Something Went Wrong!'
    end
    redirect_to profile_path(@profile)
  end

  def show
    @profile = User.find(params[:id]).profile
  end

  def edit
    if @profile.id == current_user.profile.id
      render 'edit'
    else
      flash[:alert] = 'You are not authorized to edit the profile.......'
      redirect_to root_path
    end
  end

  def update
    if @profile.update(profile_params) &&
       @profile.image.build(image_params).save
      flash[:notice] = 'Changes Successfully Updated!'
    else
      flash[:alert] = 'Something Went Wrong!'
    end
    redirect_to profile_path(@profile)
  end

  def destroy
    @profile&.destroy
    flash[:notice] = 'Successfully deleted!'
    redirect_to root_path
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :username,
                                    :website, :bio, :phone_number)
  end

  def image_params
    params.require(:profile).permit(:image)
  end
end
