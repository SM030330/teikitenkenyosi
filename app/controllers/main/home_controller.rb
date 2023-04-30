class Main::HomeController < ApplicationController
  def index
    if main_user_signed_in?      
      @coming_items = current_main_user.items.includes(:inspection).where(doing: false).where("do_day >= ? ", Date.current).order( do_day: :asc) 
      @user_items = current_main_user.items.includes(:inspection)
    end
  end

  def confirm
  end
end
