class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create 
    user = User.new(sign_up_params)
    if user.save 
      profile = Profile.new(profile_params)
      profile.user_id = user.id
      profile.save
    end
  end

  private
  def profile_params
    params[:user][:profile].permit(:username, :website, :phone_number)
  end
end