class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def eventful
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Eventful") if is_navigational_format?
    else
      session["devise.eventful_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  protected

  def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome to Nacho Swag, #{current_user.email}"
    user_path
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome back, #{current_user.email}"
    user_path
  end
end
