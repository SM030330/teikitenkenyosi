class Main::Users::UsersController < ApplicationController
  before_action :authenticate_main_user!

  def show
  end
end
