class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def index
  end

  def complete
  end

  def new
    unless session["devise.facebook_data"].nil?
      information = session["devise.facebook_data"]
      @name = information["info"]["name"]
      @email = information["info"]["email"]
      @password = information["password"]
      @provider = information["provider"]
      @uid = information["uid"]
    end
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  def after_sign_up_path_for(resource)
    new_user_card_path(current_user)
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_card_path(current_user)
  end

end
