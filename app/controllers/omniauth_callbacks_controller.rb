class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # replace with your authenticate method
  # skip_before_action :authenticate_user!
  # before_action :authenticate_user!
  # skip_before_action :authenticate_user, only: [:create], raise: false
  # before_action :authenticate_user!, except: :action_here



  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      # flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."

      # params[:error] = :account_not_found

    end
    # redirect_to root_path
  end

end
