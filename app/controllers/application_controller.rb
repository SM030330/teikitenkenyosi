class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :inspection_precreate, if: :main_user_signed_in?

  private
  def inspection_precreate
    @inspection = current_main_user.inspections.build
    @inspection.items.build
  end
end
