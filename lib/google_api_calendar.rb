class GoogleApiCalendar
  require 'googleauth'
  require 'googleauth/web_user_authorizer'
  require 'google/apis/calendar_v3'
  attr_accessor :credentials, :redirect_url
  
  def initialize(user_id, request)
    @user_id = user_id
    @request = request
    authorize
  end

  def authorize
    set_authorizer
    @credentials = @authorizer.get_credentials(@user_id, @request)
    if @credentials.nil?      
      @redirect_url = @authorizer.get_authorization_url(login_hint: @user_id, request: @request)
    end
  end

  def getEvent
    set_calendar_sarvice
    calendar_id = "primary"
    response = @calendar.list_events(calendar_id,
                                     max_results:   10,
                                     single_events: true)
    puts "Upcoming events:"
    puts "No upcoming events found" if @response.items.empty?
    @calendar_events = []
    response.items.each do |event|
      print event.summary + "\n"
      @calendar_events << event
    end
  end

  def addEvent(item_name, inspection_name, do_day)
    set_calendar_sarvice
    calendar_id = "primary"
    event = Google::Apis::CalendarV3::Event.new(
              summary: "点検checker #{inspection_name}の点検日",
              description: "点検項目：#{item_name} ",
              start: Google::Apis::CalendarV3::EventDateTime.new(
                        date: do_day.iso8601,
                        time_zone: 'Asia/Tokyo'
                      ),
              end: Google::Apis::CalendarV3::EventDateTime.new(
                      date: do_day.iso8601,
                      time_zone: 'Asia/Tokyo'
                    ),
            )
    @calendar.insert_event(calendar_id, event)
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
    callback_url = ENV["GOOGLE_CALLBACK_URL"]

    @authorizer = Google::Auth::WebUserAuthorizer.new(client_id, scopes, token_store, callback_url)
  end

  def set_calendar_sarvice
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    # @calendar.client_options.application_name = ENV.fetch['GOOGLE_CALENDAR_APPLICATION_NAME']
    @calendar.client_options.application_name = ENV["GOOGLE_CALENDAR_APPLICATION_NAME"]
    @calendar.authorization = @credentials
  end
end
