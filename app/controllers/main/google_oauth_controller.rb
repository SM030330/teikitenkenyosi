class Main::GoogleOauthController < ApplicationController
  require 'googleauth'
  require 'googleauth/web_user_authorizer'

  def authorize
    user_id = current_main_user.id
    google_api_object = GoogleApiCalendar.new(user_id, request)

    if google_api_object.credentials.nil?
      redirect_to google_api_object.redirect_url
    else
      redirect_to main_user_registration_show_path(id: current_main_user.id, calendar_events: @calendar_events)
    end
  end

  def reauthorize
    user_id = current_main_user.id
    DbTokenStore.new.delete(user_id)
    redirect_to authorize_main_google_oauth_index_path
  end  

  def callback
    target_url = Google::Auth::WebUserAuthorizer.handle_auth_callback_deferred(request)
    redirect_to target_url
  rescue Signet::AuthorizationError
    render :authorization_error
  end

end