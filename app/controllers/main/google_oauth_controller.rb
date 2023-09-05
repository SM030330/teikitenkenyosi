class Main::GoogleOauthController < ApplicationController
  require 'googleauth'
  require 'googleauth/web_user_authorizer'
  # before_action :set_authorizer
  # before_action :set_reauthorizer

  def authorize
    set_authorizer
    user_id = current_main_user.id
    @credentials = @authorizer.get_credentials(user_id, request)
    if @credentials.nil?
      redirect_to  @authorizer.get_authorization_url(login_hint: user_id, request: request)
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

  private

  def set_authorizer
    # クライアント ID とクライアントシークレットを環境変数で渡しておく
    client_id = Google::Auth::ClientId.from_file(Rails.root.join('credentials.json').to_s)
    # Google API の OAuth スコープのリスト。例として Google Drive の読み込み専用スコープを指定。
    scopes = 'https://www.googleapis.com/auth/calendar'
    token_store = DbTokenStore.new
    # token_store = Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
    # callback アクションの URL
    callback_url = 'http://localhost:3001/main/google_oauth/callback'

    @authorizer = Google::Auth::WebUserAuthorizer.new(client_id, scopes, token_store, callback_url)
  end
end