class Main::HomeController < ApplicationController
  def index
    if main_user_signed_in?
      @inspection = current_main_user.inspections.build
      @inspection.items.build
    end
  end
end
