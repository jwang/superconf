class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout "application"

  def failure
    logger.debug "omnifail " + env['omniauth.error'].response.inspect
    logger.debug "omniauth.auth" + env['omniauth.auth'].inspect
    logger.debug "omniauth" + env['omniauth'].inspect
  end

  def google
    @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def github
    puts "[CODE] - #{request.env["omniauth.auth"].inspect}"
  end

end
