# frozen_string_literal: true

class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(sign_up_params)
    if user.save
      flash[:alert] = 'Something went Wrong' unless create_profile(user)
    else
      flash[:alert] = 'Something went Wrong'
    end
    redirect_to root_path
  end

  def create_profile(user)
    profile = Profile.new(profile_params)
    profile.user_id = user.id
    profile.save
    flash[:notice] = 'User Successfully created!'
  end

  private

  def profile_params
    params[:user][:profile].permit(:name, :username, :website, :phone_number)
  end

  def profile_image_params
    params[:user].permit(:image)
  end
end
