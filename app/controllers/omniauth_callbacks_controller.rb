# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController #:nodoc:
  # replace with your authenticate method
  # skip_before_action :authenticate_user!

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    authentication_check
  end

  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: 'Facebook')
      end
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end

  def failure
    flash[:alert] = 'Something Went Wrong! Try Again!'
    redirect_to root_path
  end

  def authentication_check
    if @user.persisted?
      flash[:notice] =
        I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] =
        request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url,
                  alert: @user.errors.full_messages.join("\n")
    end
  end
end
